# DART ablation summary

Sweep: camspeedrate = 41550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.90 (0.60) | 63.85 (8.51) | 5.60 (0.59) | 128 (26) | 2.07 (0.31) | 619.6 (128.7) | 26.7 (0.9) | 11.7 (1.0) | 2.72 (0.19) | 51% | 2.01 (0.30) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.89 (0.34) | 71.19 (18.91) | 5.36 (1.21) | 215 (60) | 2.92 (0.04) | 1032.7 (289.3) | 26.5 (0.8) | 12.3 (1.1) | 2.69 (0.16) | 53% | 2.21 (0.69) |


