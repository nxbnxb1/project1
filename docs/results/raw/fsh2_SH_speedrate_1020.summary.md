# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 1.01 (0.48) | 59.60 (6.09) | 5.53 (0.96) | 86 (18) | 1.48 (0.29) | 103.1 (21.6) | 26.6 (0.8) | 11.4 (1.0) | 2.72 (0.15) | 46% | 2.01 (0.33) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.80 (0.36) | 71.53 (21.79) | 5.05 (1.08) | 137 (46) | 2.01 (0.01) | 163.7 (55.1) | 26.7 (0.9) | 12.1 (0.8) | 2.73 (0.18) | 53% | 2.40 (0.42) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.72 (0.47) | 76.43 (29.32) | 5.17 (1.12) | 119 (48) | 1.69 (0.07) | 142.5 (57.6) | 26.3 (1.3) | 11.6 (0.7) | 2.67 (0.22) | 51% | 1.79 (0.43) |


