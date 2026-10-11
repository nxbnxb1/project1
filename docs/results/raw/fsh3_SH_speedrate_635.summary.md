# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.66 (0.45) | 82.89 (12.78) | 4.23 (0.60) | 199 (74) | 2.26 (0.52) | 237.3 (87.0) | 25.3 (0.7) | 15.2 (1.0) | 2.43 (0.13) | 27% | 2.47 (0.43) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.73 (0.45) | 71.24 (9.29) | 5.08 (0.45) | 208 (85) | 3.46 (0.01) | 247.6 (101.0) | 24.2 (2.3) | 14.6 (2.4) | 2.20 (0.42) | 19% | 2.24 (0.50) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.65 (0.46) | 72.46 (9.29) | 5.00 (0.39) | 132 (60) | 2.09 (0.24) | 157.6 (71.4) | 24.2 (1.8) | 13.7 (2.2) | 2.20 (0.33) | 20% | 2.17 (0.60) |


