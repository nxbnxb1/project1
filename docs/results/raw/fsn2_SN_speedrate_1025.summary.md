# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.22 (0.68) | 45.59 (16.54) | 7.61 (1.66) | 74 (43) | 1.54 (0.35) | 88.2 (51.3) | 23.0 (1.9) | 9.1 (4.1) | 1.88 (0.43) | 24% | 2.39 (0.54) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.16 (0.46) | 41.16 (7.17) | 7.88 (1.02) | 103 (18) | 2.51 (0.01) | 123.1 (21.0) | 23.0 (1.7) | 8.8 (3.6) | 1.87 (0.40) | 23% | 2.29 (0.84) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.23 (0.39) | 43.63 (10.06) | 7.65 (1.24) | 71 (24) | 1.59 (0.19) | 84.2 (27.9) | 22.9 (1.7) | 8.4 (3.6) | 1.85 (0.39) | 24% | 2.50 (0.79) |


