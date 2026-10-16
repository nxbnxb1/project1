# DART ablation summary

Sweep: camspeedrate = 20615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.54 (0.41) | 113.14 (28.85) | 3.36 (0.85) | 134 (63) | 1.09 (0.24) | 160.3 (76.8) | 22.7 (1.4) | 11.6 (1.5) | 2.05 (0.22) | 35% | 2.26 (0.59) |
| FR_SAFE | 15 | 60% [36, 80] | 27% [11, 52] | 0.61 (0.47) | 135.17 (59.20) | 3.48 (1.26) | 162 (101) | 1.50 (0.02) | 193.1 (119.7) | 23.7 (2.1) | 12.8 (1.8) | 2.21 (0.35) | 33% | 2.38 (0.85) |


