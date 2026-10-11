# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 10% [2, 40] | 0.80 (0.39) | 84.93 (15.52) | 4.25 (1.37) | 68 (24) | 0.90 (0.07) | 81.8 (29.8) | 26.3 (1.2) | 15.9 (1.5) | 2.67 (0.22) | 51% | 2.17 (0.31) |
| FR_SAFE | 10 | 70% [40, 89] | 20% [6, 51] | 0.70 (0.51) | 71.96 (14.48) | 4.78 (1.48) | 63 (22) | 1.01 (0.02) | 76.6 (26.1) | 26.7 (0.9) | 15.9 (1.4) | 2.72 (0.19) | 51% | 1.84 (0.21) |
| E_DART | 10 | 80% [49, 94] | 10% [2, 40] | 0.66 (0.42) | 83.03 (17.87) | 4.21 (1.17) | 82 (20) | 1.01 (0.01) | 98.5 (23.8) | 26.6 (1.3) | 15.8 (1.5) | 2.73 (0.23) | 56% | 1.94 (0.44) |


