# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.24 (1.00) | 37.44 (6.88) | 5.51 (0.50) | 76 (56) | 1.95 (1.13) | 91.5 (67.6) | 19.3 (4.7) | 6.5 (4.1) | 1.41 (0.83) | 5% | 3.94 (2.68) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.29 (0.91) | 39.19 (10.49) | 5.39 (0.72) | 171 (46) | 4.36 (0.01) | 204.9 (54.8) | 19.4 (4.9) | 6.4 (4.0) | 1.43 (0.87) | 8% | 3.74 (2.63) |
| E_DART | 30 | 97% [83, 99] | 3% [1, 17] | 2.14 (1.03) | 40.58 (17.04) | 5.40 (0.81) | 79 (60) | 1.87 (0.67) | 94.3 (72.3) | 19.3 (4.8) | 5.9 (3.9) | 1.41 (0.85) | 8% | 3.61 (2.55) |


