# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.78 (0.48) | 71.77 (25.33) | 5.41 (1.08) | 118 (72) | 1.81 (0.34) | 141.8 (87.5) | 25.7 (1.6) | 7.7 (1.1) | 2.53 (0.29) | 41% | 2.00 (0.50) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.34) | 75.31 (23.06) | 4.80 (1.19) | 188 (54) | 2.51 (0.01) | 225.7 (64.7) | 27.1 (0.8) | 8.8 (0.4) | 2.80 (0.13) | 56% | 2.42 (0.30) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.60 (0.43) | 77.91 (29.66) | 5.24 (1.40) | 134 (58) | 1.97 (0.09) | 160.9 (69.6) | 26.5 (0.7) | 8.3 (0.4) | 2.70 (0.11) | 48% | 1.97 (0.30) |


