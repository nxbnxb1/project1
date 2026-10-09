function ok = dart_detour_valid(p0, W, ob, cfg)
%DART_DETOUR_VALID The remaining detour p0 -> W(:,1) -> ... -> W(:,end) is
%   still clear of the (current) discs, with a tolerance of ref.valid_tol
%   on the radius (small estimate changes do not force a re-plan). Discs
%   that contain p0 / the end point are ignored on the first / last leg.
[C, r] = dart_detour_discs(p0, W(:, end), ob, cfg);
r = cfg.ref.valid_tol * r;
X = [p0(1:2), W(1:2, :)];
ns = size(X, 2) - 1;
in0 = sum((C - p0(1:2)).^2, 1) < r.^2;
inq = sum((C - W(1:2, end)).^2, 1) < r.^2;
ok = true;
for i = 1:ns
    A = X(:, i); D = X(:, i + 1) - A;
    t = min(max((D.' * (C - A)) / max(D.' * D, 1e-12), 0), 1);
    hit = sum((A + D .* t - C).^2, 1) < r.^2;
    if i == 1, hit = hit & ~in0; end
    if i == ns, hit = hit & ~inq; end
    if any(hit)
        ok = false; return
    end
end
end
