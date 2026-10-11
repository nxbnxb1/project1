# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.30 (0.52) | 58.10 (21.41) | 6.51 (1.98) | 49 (22) | 0.82 (0.08) | 59.2 (26.3) | 23.3 (2.1) | 9.8 (4.2) | 1.96 (0.46) | 29% | 2.35 (0.68) |
| FR_SAFE | 20 | 90% [70, 97] | 5% [1, 24] | 1.22 (0.57) | 49.59 (16.19) | 6.94 (1.84) | 52 (19) | 1.01 (0.01) | 62.7 (23.0) | 23.5 (1.7) | 9.5 (4.2) | 1.99 (0.41) | 28% | 2.56 (0.63) |
| E_DART | 20 | 90% [70, 97] | 5% [1, 24] | 1.22 (0.45) | 57.99 (31.42) | 6.49 (2.21) | 61 (33) | 1.01 (0.01) | 73.8 (40.6) | 23.4 (1.8) | 9.7 (4.4) | 2.00 (0.43) | 32% | 2.33 (0.71) |


