# DART ablation summary

Sweep: camspeedrate = 10630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.59 (0.51) | 124.33 (45.00) | 3.59 (0.98) | 212 (140) | 1.94 (0.47) | 259.8 (169.8) | 22.6 (1.1) | 12.1 (1.6) | 2.01 (0.18) | 30% | 2.19 (0.53) |
| FR_SAFE | 15 | 60% [36, 80] | 33% [15, 58] | 0.59 (0.54) | 114.97 (30.92) | 3.50 (0.91) | 294 (101) | 2.95 (0.00) | 360.2 (122.0) | 24.4 (2.0) | 14.9 (2.1) | 2.32 (0.34) | 38% | 2.36 (0.43) |


