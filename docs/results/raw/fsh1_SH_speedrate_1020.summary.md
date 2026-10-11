# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.99 (0.45) | 79.45 (26.20) | 4.69 (1.31) | 134 (54) | 1.59 (0.23) | 160.9 (66.1) | 26.9 (0.7) | 16.7 (1.5) | 2.78 (0.14) | 51% | 2.10 (0.46) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.97 (0.37) | 72.82 (15.73) | 5.02 (0.85) | 146 (31) | 2.01 (0.00) | 175.8 (39.2) | 26.6 (1.5) | 17.1 (1.5) | 2.71 (0.28) | 49% | 2.11 (0.73) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.75 (0.38) | 70.04 (17.45) | 5.17 (1.02) | 117 (31) | 1.67 (0.07) | 139.9 (38.2) | 26.2 (0.7) | 16.3 (1.0) | 2.64 (0.12) | 49% | 2.18 (0.43) |


