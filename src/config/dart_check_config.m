function dart_check_config(cfg)
%DART_CHECK_CONFIG Consistency checks between parameters of different layers.
%   Braking-CBF feasibility (method §9.1): at the safety boundary h = 0 a head-on
%   approach along a horizontal axis requires a deceleration of
%   a_b + a_bar_o + delta_a (plus a_b*ddot/v_c while the inflation grows),
%   so the commanded acceleration box must admit at least
%   a_b + a_bar_o + delta_a on each horizontal axis. Otherwise the CBF QP
%   relies on its slack exactly where the guarantee is needed.
%   Association by instance id (oracle_assoc) is only meaningful when the
%   detections carry the ray caster's labels (seg.oracle).
if cfg.cbf.enabled && strcmp(cfg.cbf.type, 'braking')
    need = cfg.sched.a_b + cfg.cbf.a_bar_o + cfg.cbf.delta_a;
    have = min(cfg.mpc.a_max(1:2));
    if have < need - 1e-9
        error('dart:config', ['a_max(1:2) = %.2f m/s^2 < a_b + a_bar_o + delta_a = %.2f m/s^2: ' ...
            'the braking CBF is infeasible at its boundary'], have, need);
    end
end
if cfg.trk.oracle_assoc && ~cfg.seg.oracle
    error('dart:config', 'trk.oracle_assoc requires seg.oracle (segment labels carry no identity)');
end
end
