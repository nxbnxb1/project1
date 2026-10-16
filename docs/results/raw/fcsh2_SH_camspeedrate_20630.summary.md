# DART ablation summary

Sweep: camspeedrate = 20630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.39 (0.37) | 113.27 (24.23) | 3.69 (0.88) | 196 (90) | 1.97 (0.38) | 234.0 (107.1) | 23.6 (1.5) | 13.4 (2.3) | 2.19 (0.26) | 33% | 2.26 (0.57) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.65 (0.47) | 114.99 (43.24) | 3.72 (0.95) | 297 (140) | 2.95 (0.01) | 354.9 (169.0) | 24.7 (1.3) | 15.3 (1.4) | 2.36 (0.22) | 36% | 2.57 (0.43) |


