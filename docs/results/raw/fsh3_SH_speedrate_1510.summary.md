# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 30% [11, 60] | 0.62 (0.57) | 71.49 (17.25) | 5.27 (1.24) | 51 (22) | 0.89 (0.09) | 59.6 (26.5) | 26.2 (1.4) | 14.4 (2.1) | 2.63 (0.25) | 49% | 1.71 (0.48) |
| FR_SAFE | 10 | 60% [31, 83] | 30% [11, 60] | 0.41 (0.45) | 85.59 (37.28) | 4.21 (1.90) | 78 (37) | 1.01 (0.01) | 91.9 (43.9) | 26.7 (1.4) | 15.9 (2.6) | 2.75 (0.25) | 56% | 1.69 (0.50) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.93 (0.29) | 88.74 (30.61) | 4.46 (1.02) | 89 (31) | 1.00 (0.00) | 105.0 (36.5) | 26.2 (1.0) | 15.4 (0.7) | 2.67 (0.16) | 54% | 1.79 (0.26) |


