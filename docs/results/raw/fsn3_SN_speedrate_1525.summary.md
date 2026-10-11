# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.34 (0.73) | 41.76 (12.49) | 7.99 (1.84) | 75 (29) | 1.84 (0.24) | 91.3 (33.8) | 24.9 (1.1) | 11.6 (3.2) | 2.31 (0.24) | 32% | 2.52 (0.91) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.20 (0.66) | 43.59 (13.16) | 7.89 (1.71) | 106 (35) | 2.51 (0.01) | 128.3 (42.4) | 25.0 (0.8) | 12.3 (3.4) | 2.32 (0.18) | 37% | 2.61 (0.68) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.03 (0.69) | 43.40 (16.07) | 8.07 (1.96) | 81 (34) | 1.97 (0.09) | 97.9 (40.5) | 25.0 (1.2) | 11.8 (3.3) | 2.33 (0.25) | 38% | 2.78 (1.02) |


