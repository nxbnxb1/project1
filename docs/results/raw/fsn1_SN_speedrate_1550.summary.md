# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.34 (0.51) | 38.70 (14.37) | 8.90 (1.75) | 121 (74) | 2.95 (0.60) | 145.3 (89.9) | 24.7 (1.3) | 5.6 (2.1) | 2.24 (0.27) | 28% | 2.73 (1.23) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.27 (0.37) | 36.63 (6.88) | 8.92 (1.40) | 184 (34) | 5.01 (0.01) | 221.1 (41.3) | 24.8 (1.0) | 5.9 (2.0) | 2.28 (0.22) | 31% | 2.98 (1.10) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.15 (0.51) | 37.56 (11.73) | 9.25 (1.92) | 114 (41) | 3.27 (0.27) | 137.4 (49.3) | 24.6 (1.0) | 5.1 (1.9) | 2.24 (0.20) | 30% | 2.79 (1.23) |


