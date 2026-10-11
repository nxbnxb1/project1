# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.80 (0.47) | 78.19 (19.01) | 4.93 (0.97) | 168 (69) | 2.19 (0.46) | 202.4 (83.2) | 26.5 (0.9) | 15.8 (1.5) | 2.69 (0.17) | 51% | 2.41 (0.65) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.83 (0.39) | 60.42 (11.28) | 5.76 (0.82) | 178 (33) | 2.95 (0.01) | 214.2 (38.6) | 26.8 (0.5) | 16.6 (0.6) | 2.74 (0.09) | 49% | 2.42 (0.60) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.49 (0.50) | 59.12 (9.72) | 6.04 (1.16) | 107 (49) | 2.27 (0.09) | 128.8 (59.0) | 26.4 (1.7) | 15.9 (2.0) | 2.65 (0.36) | 46% | 2.17 (0.65) |


