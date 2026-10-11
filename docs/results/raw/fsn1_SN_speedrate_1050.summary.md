# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.47 (0.45) | 42.63 (11.93) | 7.84 (1.36) | 123 (70) | 2.72 (0.82) | 147.6 (85.5) | 23.2 (1.9) | 9.4 (4.0) | 1.89 (0.44) | 22% | 2.74 (0.88) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.22 (0.35) | 40.83 (9.02) | 8.06 (1.08) | 204 (45) | 5.01 (0.01) | 246.1 (54.1) | 22.9 (1.6) | 9.5 (3.8) | 1.83 (0.38) | 22% | 2.73 (0.95) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.17 (0.52) | 44.82 (14.28) | 7.72 (1.45) | 112 (68) | 2.35 (0.58) | 134.9 (79.9) | 23.1 (1.8) | 9.1 (4.0) | 1.88 (0.42) | 24% | 2.86 (1.13) |


