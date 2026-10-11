# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.41 (1.70) | 43.13 (12.11) | 5.15 (0.76) | 38 (25) | 0.82 (0.37) | 45.7 (30.0) | 19.4 (5.0) | 8.1 (5.6) | 1.44 (0.89) | 12% | 3.60 (2.58) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.16 (1.48) | 50.71 (28.08) | 4.88 (1.21) | 76 (42) | 1.51 (0.01) | 91.5 (50.0) | 19.7 (5.2) | 8.7 (6.2) | 1.49 (0.92) | 16% | 3.73 (2.26) |
| E_DART | 30 | 97% [83, 99] | 0% [0, 11] | 2.34 (1.29) | 45.65 (23.85) | 4.94 (1.21) | 56 (34) | 1.17 (0.13) | 67.2 (39.8) | 19.5 (5.1) | 8.4 (6.0) | 1.46 (0.91) | 15% | 3.59 (2.49) |


