function q = dart_ob_q(ob, k, cfg)
%DART_OB_Q Process-noise PSD to propagate the covariance of obstacle k
%   (ob.q from DART_TRACKS_NOW; cfg.trk.q_acc for hand-built obstacle lists).
if isfield(ob, 'q')
    q = ob.q(k);
else
    q = cfg.trk.q_acc;
end
end
