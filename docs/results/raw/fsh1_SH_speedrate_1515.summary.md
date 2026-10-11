# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.75 (0.39) | 74.65 (19.32) | 4.84 (1.23) | 92 (22) | 1.27 (0.11) | 110.4 (27.7) | 26.5 (1.5) | 16.9 (1.7) | 2.69 (0.25) | 51% | 2.01 (0.44) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.89 (0.36) | 82.37 (17.29) | 4.26 (0.91) | 115 (37) | 1.50 (0.01) | 138.2 (45.9) | 27.1 (0.6) | 17.3 (1.8) | 2.82 (0.12) | 58% | 2.22 (0.29) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.87 (0.43) | 72.54 (21.87) | 5.20 (0.95) | 98 (27) | 1.36 (0.02) | 117.5 (35.0) | 26.3 (0.8) | 16.2 (0.7) | 2.66 (0.13) | 54% | 2.02 (0.57) |


