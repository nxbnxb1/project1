# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.41 (0.61) | 43.86 (19.22) | 8.21 (2.17) | 54 (28) | 1.19 (0.10) | 63.6 (33.7) | 24.5 (1.1) | 6.6 (2.8) | 2.22 (0.24) | 32% | 1.89 (0.66) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.32 (0.50) | 42.30 (14.30) | 8.27 (1.97) | 64 (21) | 1.51 (0.01) | 75.4 (24.6) | 24.8 (1.4) | 6.7 (2.7) | 2.28 (0.29) | 35% | 2.44 (0.85) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.14 (0.59) | 42.23 (16.71) | 8.27 (2.12) | 56 (23) | 1.33 (0.03) | 66.0 (25.8) | 24.5 (1.2) | 6.6 (2.6) | 2.23 (0.26) | 34% | 2.09 (0.48) |


