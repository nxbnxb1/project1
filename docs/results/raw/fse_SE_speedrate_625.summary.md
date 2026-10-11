# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.30 (1.13) | 43.31 (20.10) | 5.23 (0.94) | 62 (60) | 1.27 (0.66) | 74.0 (72.0) | 19.5 (5.0) | 8.6 (5.8) | 1.45 (0.89) | 10% | 3.78 (2.68) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.12 (0.95) | 42.28 (13.44) | 5.17 (0.90) | 106 (34) | 2.51 (0.01) | 127.0 (39.7) | 19.6 (5.1) | 8.5 (5.8) | 1.47 (0.91) | 12% | 3.79 (2.77) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.17 (1.19) | 42.69 (19.11) | 5.22 (0.83) | 67 (49) | 1.48 (0.37) | 80.2 (59.7) | 19.4 (5.0) | 8.1 (5.8) | 1.44 (0.89) | 12% | 3.69 (2.61) |


