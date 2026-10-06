function x = dart_quad_init_state(p0, psi0, cfg)
%DART_QUAD_INIT_STATE Hover state at position p0 with heading psi0.
q = [cos(psi0/2); 0; 0; sin(psi0/2)];
x = [p0(:); zeros(3, 1); q; zeros(3, 1); cfg.quad.m * cfg.quad.g; zeros(3, 1)];
end
