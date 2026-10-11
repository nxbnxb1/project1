# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.87 (0.28) | 81.05 (20.37) | 4.57 (0.75) | 215 (83) | 2.65 (0.90) | 258.9 (100.9) | 24.2 (1.3) | 14.5 (1.2) | 2.22 (0.21) | 21% | 2.02 (0.61) |
| FR_SAFE | 10 | 90% [60, 98] | 0% [0, 28] | 0.72 (0.18) | 69.99 (13.85) | 4.64 (0.98) | 310 (59) | 4.35 (0.00) | 373.8 (71.5) | 24.7 (0.8) | 15.5 (0.9) | 2.30 (0.17) | 22% | 2.14 (0.53) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.86 (0.30) | 72.87 (19.00) | 4.79 (0.77) | 175 (47) | 2.40 (0.13) | 210.6 (55.8) | 24.5 (1.3) | 14.7 (0.9) | 2.26 (0.19) | 19% | 2.01 (0.31) |


