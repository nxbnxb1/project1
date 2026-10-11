# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.63 (0.42) | 56.94 (10.21) | 6.11 (0.72) | 159 (79) | 2.97 (1.10) | 192.3 (94.4) | 26.2 (0.6) | 10.5 (0.9) | 2.60 (0.12) | 42% | 2.19 (0.51) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.35) | 55.53 (11.94) | 6.43 (1.04) | 266 (67) | 5.01 (0.00) | 321.0 (80.9) | 27.0 (0.7) | 11.6 (0.5) | 2.77 (0.14) | 48% | 2.40 (0.68) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.53 (0.33) | 57.98 (13.97) | 6.25 (1.17) | 176 (78) | 3.25 (0.27) | 212.3 (94.5) | 26.0 (1.6) | 10.5 (1.2) | 2.57 (0.34) | 41% | 1.86 (0.54) |


