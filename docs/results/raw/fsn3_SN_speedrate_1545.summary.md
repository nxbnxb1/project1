# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.37 (0.91) | 39.06 (8.94) | 8.45 (1.50) | 112 (40) | 2.80 (0.43) | 135.1 (49.5) | 24.9 (1.1) | 5.7 (1.5) | 2.30 (0.24) | 34% | 2.71 (1.02) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.58 (1.58) | 38.48 (7.20) | 8.53 (1.35) | 168 (31) | 4.36 (0.01) | 202.0 (37.9) | 25.0 (1.2) | 6.3 (1.7) | 2.31 (0.26) | 35% | 3.01 (1.42) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.23 (0.43) | 45.40 (18.76) | 7.95 (2.11) | 129 (50) | 2.87 (0.16) | 155.4 (59.3) | 24.7 (1.0) | 5.9 (1.7) | 2.28 (0.23) | 37% | 2.51 (0.98) |


