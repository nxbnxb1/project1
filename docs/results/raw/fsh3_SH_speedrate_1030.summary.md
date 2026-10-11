# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.96 (0.33) | 65.17 (13.70) | 5.52 (1.02) | 132 (43) | 2.00 (0.45) | 155.6 (50.4) | 26.3 (0.7) | 16.6 (1.6) | 2.66 (0.15) | 45% | 2.29 (0.36) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 1.02 (0.21) | 66.36 (15.92) | 5.44 (1.00) | 196 (47) | 2.95 (0.01) | 232.6 (54.7) | 27.1 (0.9) | 17.4 (1.2) | 2.80 (0.19) | 53% | 2.46 (0.61) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.83 (0.52) | 62.76 (16.76) | 5.86 (1.42) | 121 (49) | 2.18 (0.14) | 144.1 (58.4) | 25.8 (1.3) | 15.5 (3.0) | 2.54 (0.29) | 43% | 1.99 (0.46) |


