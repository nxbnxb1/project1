# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.26 (0.38) | 39.07 (9.32) | 8.59 (1.55) | 100 (36) | 2.50 (0.39) | 120.3 (43.7) | 24.7 (1.0) | 9.9 (3.8) | 2.25 (0.23) | 28% | 2.60 (0.79) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.10 (0.58) | 41.28 (12.87) | 8.57 (1.91) | 163 (52) | 4.01 (0.01) | 195.9 (60.9) | 24.9 (1.1) | 10.4 (3.8) | 2.29 (0.25) | 33% | 2.82 (0.98) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 0.98 (0.61) | 41.27 (14.99) | 8.73 (2.07) | 111 (47) | 2.79 (0.24) | 132.9 (57.1) | 24.7 (1.1) | 9.9 (4.0) | 2.26 (0.24) | 31% | 2.81 (1.03) |


