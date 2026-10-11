# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.84 (0.28) | 62.15 (22.23) | 5.99 (1.33) | 111 (50) | 1.75 (0.31) | 130.7 (60.5) | 26.0 (0.6) | 15.5 (1.2) | 2.58 (0.13) | 44% | 2.01 (0.31) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.96 (0.39) | 60.79 (18.41) | 6.04 (0.93) | 145 (50) | 2.51 (0.01) | 173.5 (60.7) | 26.5 (0.6) | 16.4 (0.5) | 2.69 (0.10) | 51% | 2.43 (0.52) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.79 (0.45) | 67.53 (15.67) | 5.51 (1.00) | 128 (47) | 2.04 (0.06) | 151.7 (55.7) | 26.0 (1.9) | 15.6 (1.6) | 2.62 (0.31) | 52% | 2.21 (0.47) |


