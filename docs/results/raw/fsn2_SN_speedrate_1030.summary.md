# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.53 (0.51) | 41.48 (8.32) | 7.98 (1.09) | 71 (28) | 1.66 (0.38) | 84.4 (33.2) | 22.7 (1.7) | 8.6 (3.7) | 1.79 (0.39) | 20% | 2.24 (0.62) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.21 (0.46) | 45.51 (18.40) | 7.64 (1.52) | 134 (54) | 2.96 (0.01) | 159.7 (62.6) | 23.2 (1.8) | 9.5 (3.9) | 1.92 (0.42) | 25% | 2.90 (0.95) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.17 (0.35) | 45.65 (14.56) | 7.61 (1.49) | 81 (34) | 1.72 (0.23) | 96.0 (39.7) | 22.7 (1.5) | 8.7 (3.3) | 1.82 (0.35) | 24% | 2.40 (0.57) |


