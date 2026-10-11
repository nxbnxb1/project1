# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.47 (1.39) | 50.38 (28.24) | 4.88 (1.17) | 35 (32) | 0.62 (0.23) | 41.8 (37.1) | 19.8 (5.4) | 5.3 (3.8) | 1.51 (0.96) | 16% | 3.19 (2.44) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.15 (1.53) | 53.83 (40.33) | 4.93 (1.13) | 53 (40) | 1.01 (0.01) | 63.8 (47.1) | 19.7 (5.3) | 4.9 (3.5) | 1.50 (0.94) | 17% | 3.29 (2.51) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.43 (1.24) | 55.86 (36.24) | 4.71 (1.36) | 56 (36) | 1.01 (0.01) | 67.4 (42.2) | 19.7 (5.3) | 5.0 (3.6) | 1.51 (0.95) | 18% | 3.24 (2.59) |


