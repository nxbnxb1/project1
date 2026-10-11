# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.44 (2.37) | 26.73 (11.95) | 8.63 (2.20) | 73 (62) | 2.40 (0.99) | 87.9 (74.7) | 23.3 (1.8) | 8.5 (5.3) | 2.02 (0.40) | 28% | 3.67 (2.53) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.75 (1.59) | 25.90 (8.27) | 8.45 (1.94) | 130 (41) | 5.02 (0.01) | 155.6 (48.9) | 23.5 (1.7) | 9.3 (5.4) | 2.07 (0.39) | 31% | 3.51 (2.49) |
| E_DART | 30 | 97% [83, 99] | 3% [1, 17] | 2.57 (1.54) | 24.56 (6.14) | 8.44 (2.09) | 79 (37) | 2.97 (0.35) | 94.8 (44.4) | 23.4 (1.6) | 8.9 (5.3) | 2.06 (0.37) | 29% | 3.66 (2.46) |


