# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 20% [6, 51] | 0.58 (0.46) | 126.64 (20.77) | 3.28 (0.55) | 102 (32) | 0.92 (0.05) | 122.9 (37.7) | 26.1 (1.8) | 8.4 (0.8) | 2.64 (0.31) | 55% | 2.13 (0.68) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.70 (0.38) | 110.10 (38.17) | 3.87 (1.14) | 101 (47) | 1.01 (0.01) | 121.0 (58.0) | 26.3 (1.0) | 8.5 (0.7) | 2.68 (0.18) | 53% | 2.14 (0.58) |
| E_DART | 10 | 80% [49, 94] | 10% [2, 40] | 0.65 (0.39) | 98.48 (29.55) | 3.89 (1.19) | 100 (26) | 1.01 (0.00) | 119.3 (30.4) | 26.8 (0.6) | 8.7 (0.6) | 2.76 (0.12) | 57% | 2.12 (0.44) |


