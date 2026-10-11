# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.20 (1.69) | 26.99 (10.92) | 8.51 (2.11) | 50 (33) | 1.70 (0.46) | 59.5 (39.2) | 23.2 (1.8) | 6.4 (3.9) | 2.01 (0.39) | 29% | 3.58 (2.55) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.95 (1.61) | 26.64 (9.63) | 8.33 (2.09) | 78 (28) | 2.96 (0.01) | 93.6 (33.0) | 23.7 (1.9) | 7.0 (4.1) | 2.10 (0.43) | 31% | 3.65 (2.42) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.67 (1.50) | 28.26 (12.80) | 8.26 (2.25) | 60 (33) | 2.07 (0.18) | 71.7 (38.5) | 23.5 (1.9) | 6.7 (4.1) | 2.07 (0.42) | 31% | 3.55 (2.54) |


