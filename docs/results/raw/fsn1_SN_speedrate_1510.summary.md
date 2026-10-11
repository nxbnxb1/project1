# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.37 (0.72) | 47.16 (20.85) | 7.87 (2.24) | 41 (20) | 0.87 (0.04) | 50.2 (23.4) | 24.4 (1.3) | 6.9 (3.0) | 2.17 (0.31) | 31% | 2.29 (0.75) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 1.10 (0.78) | 48.56 (23.12) | 7.41 (2.34) | 51 (23) | 1.01 (0.01) | 61.8 (26.6) | 24.2 (1.9) | 7.1 (3.2) | 2.17 (0.39) | 34% | 2.45 (0.81) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.32 (1.02) | 43.34 (16.24) | 8.21 (2.00) | 42 (17) | 1.02 (0.01) | 51.0 (19.2) | 24.6 (1.1) | 6.7 (2.7) | 2.20 (0.28) | 32% | 2.59 (1.19) |


