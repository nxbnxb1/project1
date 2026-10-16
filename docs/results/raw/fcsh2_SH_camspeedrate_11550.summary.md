# DART ablation summary

Sweep: camspeedrate = 11550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.73 (0.46) | 86.82 (25.55) | 4.59 (1.09) | 286 (127) | 3.42 (0.67) | 350.0 (157.7) | 24.8 (1.3) | 8.6 (1.0) | 2.40 (0.21) | 48% | 2.09 (0.43) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.98 (0.53) | 72.98 (30.38) | 5.54 (1.27) | 339 (159) | 5.01 (0.01) | 414.7 (194.3) | 25.5 (0.8) | 9.8 (1.0) | 2.51 (0.14) | 50% | 2.31 (0.37) |


