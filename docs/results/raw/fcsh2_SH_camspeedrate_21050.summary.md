# DART ablation summary

Sweep: camspeedrate = 21050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.45 (0.46) | 71.60 (18.83) | 5.13 (1.65) | 209 (120) | 3.65 (0.70) | 248.8 (141.4) | 24.9 (1.4) | 9.6 (1.2) | 2.41 (0.21) | 44% | 2.14 (0.62) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.72 (0.50) | 73.63 (26.00) | 5.48 (1.24) | 342 (154) | 5.01 (0.02) | 409.4 (186.0) | 25.4 (1.4) | 10.6 (1.4) | 2.50 (0.24) | 46% | 2.33 (0.56) |


