# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.58 (0.39) | 62.43 (10.79) | 5.65 (0.61) | 161 (75) | 2.77 (0.86) | 193.7 (89.9) | 26.6 (0.8) | 8.9 (0.9) | 2.70 (0.16) | 47% | 2.13 (0.37) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.33) | 67.97 (20.18) | 5.57 (1.17) | 274 (108) | 4.36 (0.02) | 328.1 (128.7) | 26.4 (1.0) | 9.1 (0.7) | 2.67 (0.19) | 50% | 2.42 (0.41) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.64 (0.32) | 58.99 (10.32) | 5.89 (0.77) | 167 (57) | 3.03 (0.28) | 202.0 (68.4) | 26.5 (0.9) | 9.0 (0.6) | 2.68 (0.18) | 50% | 2.11 (0.18) |


