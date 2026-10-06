classdef DartControllerSys < matlab.System
    %DARTCONTROLLERSYS Outer-loop DART controller as a MATLAB System block.
    %   Inputs : t, x (17x1 plant state), msg (perception message)
    %   Outputs: cmd = [a_cmd; psi_cmd] (4x1), trigger (1x1), diag (Nd x 1)
    %   Runs in "Interpreted execution" mode and calls the same functions as
    %   the MATLAB engine (src/control/dart_controller_step.m).
    properties (Nontunable)
        RegistryKey = 'dart'   % key used with dart_registry
        Ts = 0.01              % sample time [s]
    end
    properties (Access = private)
        ctrl
    end
    methods (Access = protected)
        function setupImpl(obj)
            obj.ctrl = init_ctrl(obj);
        end
        function resetImpl(obj)
            obj.ctrl = init_ctrl(obj);
        end
        function [cmd, trig, dg] = stepImpl(obj, t, x, msg)
            [obj.ctrl, cmd, trig, dg] = dart_controller_step(obj.ctrl, t, x, msg);
        end
        function n = getNumInputsImpl(~),  n = 3; end
        function n = getNumOutputsImpl(~), n = 3; end
        function [s1, s2, s3] = getOutputSizeImpl(~)
            s1 = [4 1]; s2 = [1 1]; s3 = [numel(dart_diag_names()) 1];
        end
        function [d1, d2, d3] = getOutputDataTypeImpl(~)
            d1 = 'double'; d2 = 'double'; d3 = 'double';
        end
        function [c1, c2, c3] = isOutputComplexImpl(~)
            c1 = false; c2 = false; c3 = false;
        end
        function [f1, f2, f3] = isOutputFixedSizeImpl(~)
            f1 = true; f2 = true; f3 = true;
        end
        function sts = getSampleTimeImpl(obj)
            sts = createSampleTime(obj, 'Type', 'Discrete', 'SampleTime', obj.Ts);
        end
        function [n1, n2, n3] = getInputNamesImpl(~)
            n1 = 't'; n2 = 'x'; n3 = 'msg';
        end
        function [n1, n2, n3] = getOutputNamesImpl(~)
            n1 = 'cmd'; n2 = 'trigger'; n3 = 'diag';
        end
    end
    methods (Static, Access = protected)
        function simMode = getSimulateUsingImpl
            simMode = 'Interpreted execution';
        end
        function flag = showSimulateUsingImpl
            flag = false;
        end
    end
end

function ctrl = init_ctrl(obj)
cfg = dart_registry('get', [obj.RegistryKey '_cfg']);
world = dart_registry('get', [obj.RegistryKey '_world']);
ctrl = dart_controller_init(cfg, world, cfg.sim.seed);
end
