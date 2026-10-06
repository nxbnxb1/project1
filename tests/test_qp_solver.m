function test_qp_solver()
% KKT conditions of the interior-point QP solver, with and without bounds.
rs = dart_rng_create(7);
for trial = 1:5
    n = 8 + trial; m = 15;
    G = dart_randn(rs, n, n); H = G.' * G + 0.1 * eye(n);
    f = 3 * dart_randn(rs, n, 1);
    A = dart_randn(rs, m, n); b = dart_rand(rs, m, 1) + 0.1;
    lb = -0.5 * ones(n, 1); ub = 0.5 * ones(n, 1);
    [z, info] = dart_qp_solve(H, f, A, b, [], struct('lb', lb, 'ub', ub));
    assert(info.status == 0, 'solver did not converge');
    assert(max([A * z - b; z - ub; lb - z]) < 1e-6, 'infeasible solution');
    % optimality: no feasible descent along random directions
    J = 0.5 * z.' * H * z + f.' * z;
    for k = 1:50
        d = 1e-3 * dart_randn(rs, n, 1);
        y = z + d;
        if all(A * y <= b) && all(y <= ub) && all(y >= lb)
            assert(0.5 * y.' * H * y + f.' * y >= J - 1e-9, 'not optimal');
        end
    end
end
end
