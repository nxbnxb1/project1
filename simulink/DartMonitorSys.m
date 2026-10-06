classdef DartMonitorSys < matlab.System
    %DARTMONITORSYS Ground-truth monitor: clearance to the closest obstacle
    %   and stop flag (collision or goal reached).
    %   Inputs : t, x (true state)    Outputs: clearance, stop
    properties (Nontunable)
        RegistryKey = 'dart'
        Ts = 0.01
    end
    properties (Access = private)
        cfg
        world
    end
    methods (Access = protected)
        function setupImpl(obj)
            obj.cfg = dart_registry('get', [obj.RegistryKey '_cfg']);
            obj.world = dart_registry('get', [obj.RegistryKey '_world']);
        end
        function [clr, stop] = stepImpl(obj, t, x)
            clr = dart_world_clearance(obj.world, x(1:3), t, obj.cfg.quad.r_body);
            goal = norm(x(1:3) - obj.world.goal) < obj.cfg.sim.goal_tol;
            stop = double(goal || (clr < 0 && obj.cfg.sim.stop_on_collision) || any(~isfinite(x)));
        end
        function n = getNumInputsImpl(~),  n = 2; end
        function n = getNumOutputsImpl(~), n = 2; end
        function [s1, s2] = getOutputSizeImpl(~), s1 = [1 1]; s2 = [1 1]; end
        function [d1, d2] = getOutputDataTypeImpl(~), d1 = 'double'; d2 = 'double'; end
        function [c1, c2] = isOutputComplexImpl(~), c1 = false; c2 = false; end
        function [f1, f2] = isOutputFixedSizeImpl(~), f1 = true; f2 = true; end
        function sts = getSampleTimeImpl(obj)
            sts = createSampleTime(obj, 'Type', 'Discrete', 'SampleTime', obj.Ts);
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
