# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.80 (0.37) | 70.87 (6.92) | 4.91 (0.41) | 160 (77) | 2.57 (1.06) | 190.0 (92.7) | 24.8 (1.9) | 14.3 (2.3) | 2.31 (0.34) | 19% | 2.11 (0.63) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.71 (0.40) | 71.08 (8.75) | 4.92 (0.40) | 285 (87) | 4.35 (0.00) | 340.4 (105.1) | 24.6 (1.5) | 15.2 (1.8) | 2.28 (0.27) | 20% | 2.16 (0.54) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.78 (0.48) | 69.52 (7.40) | 4.98 (0.39) | 149 (67) | 2.44 (0.31) | 176.7 (79.7) | 24.2 (2.0) | 14.1 (2.3) | 2.21 (0.38) | 20% | 2.07 (0.42) |


