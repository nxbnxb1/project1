# DART ablation summary

Sweep: camspeedrate = 11045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 20% [10, 37] | 1.21 (1.01) | 47.82 (20.44) | 6.95 (1.95) | 123 (89) | 2.32 (0.75) | 150.4 (109.1) | 22.9 (1.9) | 8.5 (2.8) | 1.89 (0.36) | 26% | 2.35 (0.83) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.35 (0.87) | 49.29 (13.23) | 6.96 (1.74) | 214 (57) | 4.36 (0.01) | 262.6 (69.8) | 23.0 (1.6) | 9.1 (3.2) | 1.90 (0.38) | 29% | 2.47 (0.99) |


