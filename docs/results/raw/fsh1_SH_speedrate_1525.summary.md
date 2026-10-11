# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.75 (0.48) | 82.18 (34.35) | 4.75 (1.36) | 150 (84) | 1.95 (0.30) | 178.8 (100.7) | 26.5 (1.1) | 9.4 (0.6) | 2.70 (0.19) | 48% | 2.02 (0.43) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.63 (0.46) | 59.33 (16.64) | 5.89 (1.31) | 133 (53) | 2.51 (0.02) | 160.4 (63.7) | 26.0 (1.5) | 9.1 (0.6) | 2.62 (0.23) | 49% | 2.02 (0.34) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.72 (0.47) | 67.32 (19.51) | 5.51 (0.88) | 122 (47) | 2.03 (0.07) | 147.5 (57.0) | 27.1 (0.7) | 9.5 (0.7) | 2.78 (0.14) | 51% | 2.17 (0.29) |


