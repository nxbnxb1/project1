# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.93 (1.69) | 31.01 (14.87) | 7.55 (1.77) | 40 (33) | 1.17 (0.41) | 48.1 (38.8) | 22.3 (3.0) | 8.9 (6.0) | 1.79 (0.69) | 25% | 3.65 (2.45) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.58 (1.54) | 34.03 (17.32) | 7.14 (2.10) | 68 (35) | 2.01 (0.01) | 81.8 (40.7) | 22.8 (3.3) | 9.6 (6.4) | 1.89 (0.74) | 30% | 3.47 (2.38) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.41 (1.42) | 36.27 (25.27) | 7.14 (2.13) | 56 (50) | 1.44 (0.24) | 67.6 (60.1) | 22.6 (3.2) | 9.2 (6.4) | 1.86 (0.72) | 29% | 3.27 (2.47) |


