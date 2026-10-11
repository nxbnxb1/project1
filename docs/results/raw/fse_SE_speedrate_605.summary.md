# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.42 (1.65) | 65.30 (55.75) | 4.47 (1.68) | 28 (28) | 0.39 (0.08) | 33.4 (32.8) | 19.9 (5.4) | 8.1 (6.3) | 1.53 (0.97) | 21% | 3.31 (2.51) |
| FR_SAFE | 30 | 87% [70, 95] | 7% [2, 21] | 2.53 (1.57) | 65.50 (55.12) | 4.39 (1.78) | 34 (27) | 0.51 (0.01) | 40.9 (31.4) | 20.0 (5.5) | 8.3 (6.6) | 1.54 (0.99) | 20% | 3.16 (2.46) |
| E_DART | 30 | 93% [79, 98] | 7% [2, 21] | 2.22 (1.37) | 56.36 (38.76) | 4.68 (1.43) | 28 (19) | 0.51 (0.01) | 34.0 (22.3) | 19.8 (5.3) | 7.7 (5.9) | 1.51 (0.94) | 20% | 3.42 (2.63) |


