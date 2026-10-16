# DART ablation summary

Sweep: camspeedrate = 21515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 13% [4, 38] | 80% [55, 93] | 0.04 (0.14) | 88.18 (55.53) | 4.90 (1.83) | 69 (60) | 1.31 (0.16) | 81.9 (71.3) | 23.1 (2.2) | 9.8 (2.4) | 2.09 (0.36) | 43% | 2.10 (0.63) |
| FR_SAFE | 15 | 20% [7, 45] | 73% [48, 89] | 0.11 (0.32) | 96.04 (8.75) | 4.09 (1.73) | 93 (54) | 1.50 (0.01) | 110.1 (65.3) | 23.2 (2.6) | 10.6 (2.1) | 2.13 (0.40) | 47% | 1.98 (0.64) |


