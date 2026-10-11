# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.91 (1.43) | 27.67 (12.87) | 8.44 (2.22) | 70 (57) | 2.22 (0.81) | 83.5 (68.3) | 23.4 (1.8) | 6.6 (4.0) | 2.05 (0.40) | 31% | 3.56 (2.47) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.69 (1.26) | 27.12 (10.75) | 8.30 (2.14) | 118 (47) | 4.37 (0.01) | 141.7 (55.5) | 23.6 (1.9) | 6.9 (4.1) | 2.10 (0.42) | 32% | 3.71 (2.66) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.48 (1.48) | 28.07 (13.49) | 8.29 (2.19) | 77 (41) | 2.71 (0.33) | 92.6 (48.8) | 23.3 (1.7) | 6.5 (3.9) | 2.04 (0.38) | 29% | 3.63 (2.40) |


