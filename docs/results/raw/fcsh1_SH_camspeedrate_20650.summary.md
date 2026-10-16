# DART ablation summary

Sweep: camspeedrate = 20650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.52 (0.41) | 98.68 (18.28) | 3.91 (0.83) | 265 (140) | 2.88 (0.88) | 318.7 (165.0) | 23.5 (1.0) | 7.6 (1.0) | 2.16 (0.18) | 33% | 2.42 (0.52) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.71 (0.49) | 85.64 (20.55) | 4.46 (0.65) | 419 (106) | 5.01 (0.00) | 504.4 (130.6) | 25.1 (0.8) | 8.6 (0.5) | 2.39 (0.16) | 29% | 2.44 (0.31) |


