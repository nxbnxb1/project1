# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.84 (0.47) | 63.21 (10.22) | 5.61 (0.84) | 110 (37) | 1.79 (0.33) | 130.1 (45.5) | 26.6 (0.9) | 11.0 (1.0) | 2.70 (0.18) | 48% | 1.96 (0.46) |
| FR_SAFE | 10 | 80% [49, 94] | 20% [6, 51] | 0.75 (0.43) | 73.00 (22.22) | 5.29 (1.15) | 167 (69) | 2.51 (0.02) | 198.5 (82.3) | 26.6 (1.1) | 11.5 (1.3) | 2.71 (0.21) | 51% | 2.19 (0.81) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.69 (0.57) | 69.46 (18.61) | 5.07 (1.19) | 137 (60) | 2.01 (0.10) | 162.1 (71.1) | 26.7 (1.0) | 11.4 (1.0) | 2.72 (0.19) | 51% | 2.23 (0.66) |


