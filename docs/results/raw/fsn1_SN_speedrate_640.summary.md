# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 90% [70, 97] | 10% [3, 30] | 1.02 (0.48) | 64.98 (19.42) | 5.15 (0.86) | 141 (100) | 1.96 (0.76) | 169.9 (120.4) | 19.0 (3.2) | 4.8 (2.4) | 1.32 (0.57) | 11% | 2.69 (0.82) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.08 (0.27) | 62.52 (10.24) | 5.29 (0.51) | 251 (41) | 4.01 (0.01) | 302.0 (50.6) | 18.9 (2.9) | 4.8 (2.1) | 1.30 (0.51) | 11% | 2.93 (0.83) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 0.99 (0.45) | 62.73 (12.03) | 5.28 (0.57) | 108 (49) | 1.66 (0.40) | 130.0 (59.5) | 18.8 (3.2) | 4.5 (2.2) | 1.28 (0.56) | 11% | 2.65 (1.16) |


