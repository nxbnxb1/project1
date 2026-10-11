# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.26 (0.80) | 33.94 (4.53) | 9.22 (1.30) | 89 (21) | 2.65 (0.50) | 105.8 (25.4) | 24.5 (1.0) | 5.2 (1.8) | 2.21 (0.21) | 28% | 2.36 (0.63) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.36 (0.39) | 37.37 (10.42) | 8.92 (1.49) | 163 (45) | 4.36 (0.01) | 193.4 (52.1) | 24.6 (0.9) | 5.5 (1.8) | 2.24 (0.19) | 32% | 2.50 (0.73) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.19 (0.34) | 35.46 (6.54) | 9.08 (1.32) | 105 (22) | 2.95 (0.18) | 124.9 (25.8) | 24.7 (1.0) | 5.4 (1.9) | 2.25 (0.23) | 31% | 2.39 (0.57) |


