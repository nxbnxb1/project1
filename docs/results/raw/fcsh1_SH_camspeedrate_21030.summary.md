# DART ablation summary

Sweep: camspeedrate = 21030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 33% [15, 58] | 0.38 (0.39) | 107.37 (45.96) | 4.34 (1.29) | 189 (141) | 2.23 (0.42) | 227.0 (167.7) | 23.8 (1.5) | 12.9 (2.2) | 2.22 (0.23) | 46% | 2.31 (0.57) |
| FR_SAFE | 15 | 73% [48, 89] | 20% [7, 45] | 0.63 (0.48) | 90.25 (24.87) | 4.57 (1.47) | 266 (142) | 2.95 (0.01) | 319.4 (170.6) | 24.7 (1.5) | 14.3 (1.7) | 2.38 (0.25) | 44% | 2.14 (0.44) |


