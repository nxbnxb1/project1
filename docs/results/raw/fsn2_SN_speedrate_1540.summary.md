# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.29 (0.57) | 36.72 (8.29) | 8.97 (1.50) | 90 (31) | 2.41 (0.46) | 107.4 (35.9) | 24.4 (1.1) | 9.0 (3.4) | 2.21 (0.24) | 28% | 2.48 (0.79) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.24 (0.40) | 36.36 (7.19) | 8.92 (1.40) | 146 (29) | 4.02 (0.01) | 173.6 (34.0) | 24.5 (0.9) | 9.3 (3.0) | 2.22 (0.19) | 31% | 2.33 (0.64) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.27 (0.45) | 38.42 (11.38) | 8.76 (1.65) | 108 (37) | 2.80 (0.16) | 128.7 (42.7) | 24.8 (1.1) | 9.5 (3.5) | 2.29 (0.24) | 33% | 2.31 (0.71) |


