# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.83 (0.37) | 62.37 (11.60) | 5.75 (0.92) | 86 (35) | 1.54 (0.28) | 101.8 (42.3) | 26.6 (0.8) | 8.5 (1.1) | 2.70 (0.16) | 44% | 1.98 (0.51) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.83 (0.39) | 76.95 (25.41) | 5.26 (1.29) | 147 (54) | 2.01 (0.00) | 175.2 (64.4) | 26.0 (1.3) | 9.1 (0.9) | 2.59 (0.23) | 48% | 2.42 (0.38) |
| E_DART | 10 | 90% [60, 98] | 0% [0, 28] | 0.91 (0.44) | 74.96 (15.60) | 4.68 (0.94) | 136 (39) | 1.69 (0.08) | 160.4 (47.3) | 26.5 (0.7) | 9.3 (0.6) | 2.69 (0.13) | 55% | 2.14 (0.43) |


