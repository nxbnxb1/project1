# DART ablation summary

Sweep: camspeedrate = 11550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 0.60 (0.42) | 79.52 (24.26) | 4.74 (1.43) | 271 (136) | 3.46 (0.74) | 331.7 (168.1) | 24.1 (1.3) | 9.5 (1.0) | 2.29 (0.19) | 45% | 2.19 (0.40) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.57 (0.37) | 82.06 (20.98) | 4.83 (1.09) | 375 (153) | 5.01 (0.01) | 458.7 (187.5) | 25.5 (1.1) | 11.2 (1.0) | 2.52 (0.18) | 51% | 2.46 (0.66) |


