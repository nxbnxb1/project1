function [perc, msg] = dart_perception_output(perc, t)
%DART_PERCEPTION_OUTPUT Release the in-flight result when its arrival time
%   t_a = t_c + tau_p (Eq. 13-14) has passed. Output depends on the state
%   only (no direct feed-through), which avoids algebraic loops in Simulink.
[~, len] = dart_msg_size();
msg = zeros(len, 1);
if perc.busy && t >= perc.t_a - 1e-9
    msg = perc.pending;
    perc.busy = false;
end
end
