# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.69 (0.46) | 66.43 (15.72) | 5.51 (0.96) | 91 (34) | 1.53 (0.24) | 107.7 (40.7) | 26.3 (0.9) | 11.8 (0.9) | 2.65 (0.17) | 48% | 1.99 (0.34) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.77 (0.55) | 59.97 (8.42) | 5.47 (0.83) | 123 (16) | 2.01 (0.01) | 146.6 (19.1) | 26.7 (0.6) | 12.6 (0.8) | 2.72 (0.11) | 53% | 2.27 (0.51) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.79 (0.48) | 71.01 (13.72) | 5.09 (0.78) | 118 (29) | 1.72 (0.07) | 140.6 (35.1) | 26.8 (0.7) | 12.4 (0.7) | 2.74 (0.12) | 54% | 2.12 (0.32) |


