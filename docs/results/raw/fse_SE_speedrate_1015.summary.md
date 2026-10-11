# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.69 (1.87) | 39.67 (32.60) | 7.06 (2.39) | 45 (50) | 0.99 (0.29) | 54.2 (59.9) | 22.9 (3.4) | 6.6 (4.7) | 1.91 (0.77) | 29% | 3.28 (2.40) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.81 (1.62) | 41.20 (35.42) | 7.01 (2.43) | 62 (53) | 1.51 (0.01) | 74.3 (63.2) | 22.7 (3.3) | 6.6 (4.6) | 1.87 (0.75) | 29% | 3.33 (2.32) |
| E_DART | 30 | 97% [83, 99] | 3% [1, 17] | 2.44 (1.59) | 36.59 (25.74) | 6.99 (2.25) | 48 (37) | 1.25 (0.10) | 57.6 (42.5) | 22.5 (3.1) | 6.3 (4.4) | 1.84 (0.70) | 28% | 3.29 (2.37) |


