# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.12 (0.60) | 49.49 (22.13) | 7.39 (1.70) | 54 (32) | 1.07 (0.18) | 65.7 (38.7) | 23.5 (2.0) | 8.8 (3.7) | 1.97 (0.46) | 28% | 2.74 (1.02) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.35 (0.53) | 48.55 (15.92) | 7.06 (1.77) | 77 (30) | 1.50 (0.01) | 93.5 (36.4) | 23.7 (1.8) | 9.2 (3.8) | 2.02 (0.42) | 30% | 2.70 (0.81) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.24 (0.56) | 45.81 (11.55) | 7.26 (1.37) | 58 (17) | 1.27 (0.07) | 70.5 (19.5) | 23.7 (1.9) | 9.0 (3.7) | 2.01 (0.43) | 30% | 2.67 (0.97) |


