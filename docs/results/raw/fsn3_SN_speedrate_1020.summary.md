# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.24 (0.79) | 51.13 (13.50) | 6.77 (1.40) | 76 (29) | 1.44 (0.23) | 91.4 (34.3) | 24.0 (1.6) | 10.7 (3.2) | 2.10 (0.37) | 32% | 2.46 (0.91) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 1.11 (0.53) | 46.04 (14.72) | 7.17 (1.69) | 96 (32) | 2.01 (0.01) | 115.6 (39.9) | 23.8 (1.6) | 10.2 (3.4) | 2.04 (0.37) | 30% | 2.30 (0.87) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.15 (0.84) | 47.98 (15.74) | 7.21 (1.46) | 73 (28) | 1.51 (0.11) | 88.4 (33.6) | 23.7 (1.7) | 10.0 (3.2) | 2.04 (0.38) | 31% | 2.51 (0.88) |


