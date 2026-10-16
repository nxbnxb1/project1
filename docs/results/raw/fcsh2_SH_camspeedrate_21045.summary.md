# DART ablation summary

Sweep: camspeedrate = 21045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.48 (0.48) | 77.37 (32.54) | 5.28 (1.34) | 197 (132) | 2.87 (0.61) | 235.6 (158.3) | 24.8 (1.1) | 13.3 (1.6) | 2.37 (0.19) | 45% | 2.03 (0.47) |
| FR_SAFE | 15 | 67% [42, 85] | 20% [7, 45] | 0.73 (0.54) | 76.34 (13.22) | 4.57 (1.36) | 324 (110) | 4.36 (0.01) | 386.7 (130.3) | 24.7 (2.0) | 15.2 (2.3) | 2.39 (0.31) | 47% | 2.26 (0.50) |


