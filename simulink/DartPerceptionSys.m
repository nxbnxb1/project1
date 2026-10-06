classdef DartPerceptionSys < matlab.System
    %DARTPERCEPTIONSYS Camera + monocular depth AI + latency as a MATLAB System block.
    %   Inputs : t, x (true 17x1 state, used for rendering), trigger
    %   Outputs: msg (perception message), status = [busy; n_capt; e_gpu; t_busy]
    %   The outputs do not depend on the current inputs (no direct
    %   feed-through), so the controller->trigger->perception->msg loop is
    %   not algebraic. A frame captured at t_c is released at the first
    %   tick t >= t_c + tau_p.
    properties (Nontunable)
        RegistryKey = 'dart'
        Ts = 0.01
    end
    properties (Access = private)
        perc
        tk
    end
    methods (Access = protected)
        function setupImpl(obj)
            init(obj);
        end
        function resetImpl(obj)
            init(obj);
        end
        function [msg, status] = outputImpl(obj, ~, ~, ~)
            [~, msg] = dart_perception_output(obj.perc, obj.tk);
            p = obj.perc;
            status = [double(p.busy); p.n_capt; p.e_gpu; p.t_busy];
        end
        function updateImpl(obj, t, x, trig)
            obj.perc = dart_perception_output(obj.perc, t);   % release (same as output)
            obj.perc = dart_perception_update(obj.perc, t, x, trig);
            obj.tk = t + obj.Ts;
        end
        function [f1, f2, f3] = isInputDirectFeedthroughImpl(~, ~, ~, ~)
            f1 = false; f2 = false; f3 = false;
        end
        function n = getNumInputsImpl(~),  n = 3; end
        function n = getNumOutputsImpl(~), n = 2; end
        function [s1, s2] = getOutputSizeImpl(~)
            [~, len] = dart_msg_size();
            s1 = [len 1]; s2 = [4 1];
        end
        function [d1, d2] = getOutputDataTypeImpl(~)
            d1 = 'double'; d2 = 'double';
        end
        function [c1, c2] = isOutputComplexImpl(~)
            c1 = false; c2 = false;
        end
        function [f1, f2] = isOutputFixedSizeImpl(~)
            f1 = true; f2 = true;
        end
        function sts = getSampleTimeImpl(obj)
            sts = createSampleTime(obj, 'Type', 'Discrete', 'SampleTime', obj.Ts);
        end
        function [n1, n2, n3] = getInputNamesImpl(~)
            n1 = 't'; n2 = 'x_true'; n3 = 'trigger';
        end
        function [n1, n2] = getOutputNamesImpl(~)
            n1 = 'msg'; n2 = 'status';
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
    methods (Access = private)
        function init(obj)
            cfg = dart_registry('get', [obj.RegistryKey '_cfg']);
            world = dart_registry('get', [obj.RegistryKey '_world']);
            obj.perc = dart_perception_init(cfg, world, cfg.sim.seed);
            obj.tk = 0;
        end
    end
end
