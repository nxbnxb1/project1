# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 0.93 (0.36) | 68.39 (14.59) | 4.97 (0.73) | 165 (75) | 2.32 (0.66) | 198.8 (90.9) | 20.0 (2.7) | 9.7 (3.4) | 1.49 (0.48) | 16% | 2.76 (0.66) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.15 (0.44) | 60.61 (7.42) | 5.37 (0.44) | 264 (32) | 4.35 (0.01) | 317.2 (38.5) | 19.2 (2.5) | 9.3 (3.1) | 1.35 (0.45) | 10% | 2.89 (1.35) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 0.99 (0.62) | 60.30 (9.98) | 5.31 (0.65) | 99 (43) | 1.79 (0.41) | 120.2 (51.5) | 19.6 (2.6) | 8.7 (3.3) | 1.41 (0.47) | 12% | 2.61 (1.14) |


