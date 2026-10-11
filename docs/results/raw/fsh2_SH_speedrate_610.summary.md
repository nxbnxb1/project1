# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 0% [0, 28] | 0.84 (0.32) | 103.16 (24.01) | 3.51 (0.87) | 91 (24) | 0.88 (0.08) | 108.9 (30.0) | 25.8 (1.0) | 11.1 (1.3) | 2.54 (0.21) | 40% | 2.04 (0.42) |
| FR_SAFE | 10 | 80% [49, 94] | 10% [2, 40] | 0.89 (0.54) | 97.91 (33.68) | 3.63 (1.05) | 94 (35) | 1.01 (0.00) | 112.3 (42.3) | 26.0 (1.3) | 11.6 (1.0) | 2.57 (0.24) | 38% | 1.91 (0.50) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.92 (0.19) | 124.25 (55.57) | 3.41 (0.91) | 125 (56) | 1.00 (0.00) | 149.2 (65.8) | 25.5 (0.8) | 11.4 (1.0) | 2.50 (0.14) | 39% | 2.10 (0.64) |


