# DART ablation summary

Sweep: camspeedrate = 20635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.50 (0.49) | 118.04 (61.61) | 3.94 (1.13) | 266 (263) | 2.12 (0.66) | 319.1 (318.2) | 23.1 (1.5) | 12.5 (2.5) | 2.10 (0.28) | 30% | 2.13 (0.68) |
| FR_SAFE | 15 | 73% [48, 89] | 20% [7, 45] | 0.65 (0.45) | 106.50 (29.29) | 4.00 (0.92) | 331 (157) | 3.46 (0.01) | 396.3 (191.1) | 24.2 (1.3) | 14.4 (1.7) | 2.25 (0.24) | 33% | 2.32 (0.53) |


