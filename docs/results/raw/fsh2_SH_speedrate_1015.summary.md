# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.75 (0.48) | 74.41 (22.92) | 4.89 (1.18) | 95 (35) | 1.22 (0.16) | 113.6 (41.6) | 26.8 (0.6) | 15.4 (1.2) | 2.74 (0.11) | 49% | 2.05 (0.27) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.90 (0.24) | 73.82 (20.97) | 4.94 (0.80) | 111 (31) | 1.50 (0.00) | 132.7 (37.5) | 27.1 (0.7) | 17.0 (1.0) | 2.80 (0.14) | 54% | 2.01 (0.54) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.62 (0.54) | 85.47 (20.13) | 4.89 (1.50) | 98 (45) | 1.37 (0.04) | 118.9 (55.1) | 26.0 (1.9) | 15.8 (2.0) | 2.61 (0.38) | 51% | 1.84 (0.40) |


