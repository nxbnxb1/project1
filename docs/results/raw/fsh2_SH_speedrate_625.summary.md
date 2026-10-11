# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.73 (0.47) | 78.11 (14.62) | 4.48 (0.59) | 129 (37) | 1.70 (0.46) | 155.7 (45.4) | 25.3 (0.6) | 8.2 (0.5) | 2.43 (0.12) | 25% | 2.11 (0.39) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.85 (0.36) | 68.00 (8.93) | 4.91 (0.40) | 167 (24) | 2.51 (0.00) | 201.6 (29.1) | 25.5 (0.7) | 8.6 (0.4) | 2.43 (0.14) | 22% | 2.13 (0.45) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.59 (0.39) | 86.58 (31.42) | 4.41 (0.87) | 142 (55) | 1.79 (0.10) | 170.7 (67.6) | 25.4 (0.9) | 8.5 (0.6) | 2.44 (0.16) | 29% | 2.20 (0.49) |


