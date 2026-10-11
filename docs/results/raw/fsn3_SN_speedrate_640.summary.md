# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.02 (0.42) | 61.12 (7.75) | 5.35 (0.45) | 124 (40) | 2.06 (0.51) | 149.8 (48.2) | 19.1 (2.2) | 8.1 (2.7) | 1.33 (0.39) | 9% | 2.47 (0.75) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.02 (0.35) | 63.81 (14.83) | 5.27 (0.66) | 256 (59) | 4.01 (0.00) | 307.6 (72.7) | 19.3 (2.4) | 8.8 (2.8) | 1.36 (0.43) | 12% | 3.06 (0.84) |
| E_DART | 20 | 85% [64, 95] | 15% [5, 36] | 0.86 (0.51) | 63.45 (12.20) | 5.15 (0.70) | 103 (46) | 1.79 (0.45) | 124.6 (54.6) | 20.0 (3.2) | 9.2 (3.8) | 1.49 (0.57) | 13% | 2.57 (1.13) |


