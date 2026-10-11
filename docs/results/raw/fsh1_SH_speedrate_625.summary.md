# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.73 (0.41) | 91.83 (27.95) | 4.21 (0.72) | 160 (71) | 1.75 (0.42) | 192.4 (86.3) | 25.0 (1.1) | 15.8 (1.6) | 2.39 (0.22) | 29% | 2.10 (0.30) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.55 (0.42) | 86.73 (28.17) | 4.34 (0.62) | 207 (74) | 2.51 (0.00) | 250.2 (90.6) | 25.5 (0.8) | 16.5 (1.1) | 2.45 (0.17) | 30% | 2.28 (0.28) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.78 (0.33) | 83.79 (10.96) | 4.21 (0.71) | 141 (35) | 1.80 (0.07) | 170.0 (42.8) | 25.2 (0.7) | 16.2 (0.9) | 2.41 (0.14) | 30% | 2.18 (0.47) |


