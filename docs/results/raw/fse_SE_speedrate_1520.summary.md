# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.10 (1.83) | 29.52 (14.91) | 8.26 (2.50) | 42 (30) | 1.32 (0.24) | 50.5 (35.2) | 23.3 (1.9) | 8.4 (5.4) | 2.03 (0.41) | 30% | 3.67 (2.51) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.57 (1.34) | 32.48 (24.02) | 7.86 (2.70) | 66 (47) | 2.02 (0.01) | 79.1 (55.4) | 23.7 (2.2) | 9.1 (5.9) | 2.12 (0.48) | 35% | 3.58 (2.22) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.57 (1.58) | 31.54 (16.36) | 7.84 (2.58) | 52 (31) | 1.60 (0.09) | 62.0 (35.8) | 23.7 (2.2) | 8.8 (5.8) | 2.11 (0.48) | 32% | 3.45 (2.44) |


