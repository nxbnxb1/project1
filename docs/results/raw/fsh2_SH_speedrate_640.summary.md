# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.43) | 72.33 (13.31) | 4.91 (0.56) | 170 (65) | 2.47 (0.82) | 203.7 (78.4) | 25.2 (0.7) | 15.1 (0.7) | 2.38 (0.14) | 20% | 2.07 (0.36) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.54) | 70.96 (12.39) | 4.60 (0.82) | 301 (71) | 4.01 (0.01) | 363.6 (85.5) | 25.3 (0.4) | 16.1 (0.8) | 2.41 (0.09) | 25% | 2.35 (0.63) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.61 (0.36) | 75.39 (24.08) | 4.74 (0.80) | 164 (75) | 2.33 (0.16) | 199.0 (90.9) | 25.2 (0.6) | 15.3 (1.0) | 2.38 (0.13) | 21% | 2.06 (0.52) |


