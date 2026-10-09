function mdl = dart_build_model(mdl, outdir)
%DART_BUILD_MODEL Programmatically build the DART closed-loop Simulink model.
%   mdl = DART_BUILD_MODEL() creates simulink/dart_closed_loop.slx.
%
%   The model is generated from code so that it can be rebuilt in a clean
%   CI runner (GitHub Actions) for any MATLAB release and reviewed as text.
%
%   Structure (rates):
%     Plant (continuous, ode4 @ dt_plant) ............ MATLAB Function + Integrator
%     Attitude controller (dt_plant) ................. MATLAB Function (Lee SO(3))
%     DART Controller (dt_ctrl) ...................... MATLAB System (interpreted)
%        delay-aware tracker, scheduler, adaptive-N MPC (20 Hz inside), CBF filter
%     Camera + Depth AI (dt_ctrl, event-driven) ...... MATLAB System (interpreted)
%     Ground-truth monitor (dt_ctrl) ................. MATLAB System -> Stop
%
%   Workspace variables used by the model (set by dart_run_simulink):
%     dart_x0, dart_plant_P, dart_dt_plant, dart_dt_ctrl, dart_t_max
if nargin < 1 || isempty(mdl), mdl = 'dart_closed_loop'; end
if nargin < 2 || isempty(outdir), outdir = fileparts(mfilename('fullpath')); end

if bdIsLoaded(mdl), close_system(mdl, 0); end
f = fullfile(outdir, [mdl '.slx']);
if exist(f, 'file'), delete(f); end
new_system(mdl);
set_param(mdl, 'SolverType', 'Fixed-step', 'Solver', 'ode4', ...
    'FixedStep', 'dart_dt_plant', 'StopTime', 'dart_t_max', ...
    'EnableMultiTasking', 'off', 'AutoInsertRateTranBlk', 'on', ...
    'ReturnWorkspaceOutputs', 'on', 'SaveTime', 'off', 'SaveOutput', 'off', ...
    'SaveState', 'off', 'SignalLogging', 'off', 'SaveFormat', 'Array');

% ------------------------------------------------------------- plant
add_block('simulink/Sources/Clock', [mdl '/Clock'], 'Position', [500 470 530 490]);
add_block('simulink/Sources/Constant', [mdl '/PlantParams'], 'Value', 'dart_plant_P', ...
    'Position', [480 520 580 540]);
add_block('simulink/Continuous/Integrator', [mdl '/State x'], ...
    'InitialCondition', 'dart_x0', 'Position', [840 400 880 440]);
mf_block([mdl '/Quadrotor 6DOF'], [650 380 780 470], ...
    {'function xdot = quad(x, u, t, P)', ...
     '%#codegen', ...
     'xdot = dart_quad_dynamics(x, u, t, P);'});
% discrete at dt_plant: the rate is inherited from the ZOH on its x input
mf_block([mdl '/Attitude Controller'], [450 250 580 340], ...
    {'function u = att(x, cmd, P)', ...
     '%#codegen', ...
     'u = dart_attitude_controller(x, cmd, P);'});
add_block('simulink/Discrete/Zero-Order Hold', [mdl '/ZOH att'], ...
    'SampleTime', 'dart_dt_plant', 'Position', [380 280 410 310]);

% ---------------------------------------------- outer loop (System blocks)
add_block('simulink/Sources/Digital Clock', [mdl '/Tick'], 'SampleTime', 'dart_dt_ctrl', ...
    'Position', [30 60 80 90]);
add_block('simulink/Discrete/Zero-Order Hold', [mdl '/ZOH ctrl'], ...
    'SampleTime', 'dart_dt_ctrl', 'Position', [80 330 110 360]);
sys_block([mdl '/DART Controller'], 'DartControllerSys', [200 140 330 240]);
sys_block([mdl '/Camera + Depth AI'], 'DartPerceptionSys', [200 20 330 100]);
sys_block([mdl '/Ground Truth Monitor'], 'DartMonitorSys', [200 540 330 610]);
add_block('simulink/Sinks/Stop Simulation', [mdl '/Stop'], 'Position', [400 580 430 610]);

% ---------------------------------------------------------- logging
log_block(mdl, 'log_t', [1000 20 1060 40]);
log_block(mdl, 'log_x', [1000 60 1060 80]);
log_block(mdl, 'log_cmd', [1000 100 1060 120]);
log_block(mdl, 'log_trig', [1000 140 1060 160]);
log_block(mdl, 'log_dg', [1000 180 1060 200]);
log_block(mdl, 'log_status', [1000 220 1060 240]);
log_block(mdl, 'log_clear', [1000 260 1060 280]);

% ------------------------------------------------------------ wiring
L = @(a, b) add_line(mdl, a, b, 'autorouting', 'on');
% plant loop
L('State x/1', 'Quadrotor 6DOF/1');
L('Attitude Controller/1', 'Quadrotor 6DOF/2');
L('Clock/1', 'Quadrotor 6DOF/3');
L('PlantParams/1', 'Quadrotor 6DOF/4');
L('Quadrotor 6DOF/1', 'State x/1');
% attitude loop (2 ms)
L('State x/1', 'ZOH att/1');
L('ZOH att/1', 'Attitude Controller/1');
L('DART Controller/1', 'Attitude Controller/2');
L('PlantParams/1', 'Attitude Controller/3');
% outer loop (10 ms)
L('State x/1', 'ZOH ctrl/1');
L('Tick/1', 'DART Controller/1');
L('ZOH ctrl/1', 'DART Controller/2');
L('Camera + Depth AI/1', 'DART Controller/3');
L('Tick/1', 'Camera + Depth AI/1');
L('ZOH ctrl/1', 'Camera + Depth AI/2');
L('DART Controller/2', 'Camera + Depth AI/3');
L('Tick/1', 'Ground Truth Monitor/1');
L('ZOH ctrl/1', 'Ground Truth Monitor/2');
L('Ground Truth Monitor/2', 'Stop/1');
% logs
L('Tick/1', 'log_t/1');
L('ZOH ctrl/1', 'log_x/1');
L('DART Controller/1', 'log_cmd/1');
L('DART Controller/2', 'log_trig/1');
L('DART Controller/3', 'log_dg/1');
L('Camera + Depth AI/2', 'log_status/1');
L('Ground Truth Monitor/1', 'log_clear/1');

annotate(mdl);
save_system(mdl, f);
fprintf('Saved %s\n', f);
end

% =====================================================================
function mf_block(path, pos, code)
add_block('simulink/User-Defined Functions/MATLAB Function', path, 'Position', pos);
rt = sfroot;
ch = rt.find('-isa', 'Stateflow.EMChart', 'Path', path);
ch.Script = sprintf('%s\n', code{:});
end

function sys_block(path, cls, pos)
add_block('simulink/User-Defined Functions/MATLAB System', path, 'Position', pos);
set_param(path, 'System', cls);
try
    set_param(path, 'SimulateUsing', 'Interpreted execution');
catch
end
set_param(path, 'Ts', 'dart_dt_ctrl');
end

function log_block(mdl, name, pos)
add_block('simulink/Sinks/To Workspace', [mdl '/' name], 'VariableName', name, ...
    'SaveFormat', 'Array', 'MaxDataPoints', 'inf', 'Position', pos);
end

function annotate(mdl)
txt = ['DART: Delay-Aware, Risk-Triggered perception-control co-design. ', ...
       'Generated by simulink/dart_build_model.m (edit the generator, not the .slx).'];
try
    note = Simulink.Annotation([mdl '/DART']);
    note.Text = txt;
    note.Position = [30 0 600 20];
catch
    % annotations are cosmetic only
end
end
