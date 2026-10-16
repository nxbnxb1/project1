# DART ablation summary

Sweep: camspeedrate = 10650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.53 (0.42) | 109.20 (33.75) | 3.81 (0.88) | 308 (188) | 3.05 (1.00) | 377.3 (229.0) | 23.3 (1.7) | 6.8 (1.0) | 2.12 (0.30) | 32% | 2.20 (0.49) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.75 (0.50) | 84.13 (15.01) | 4.46 (0.62) | 384 (115) | 5.00 (0.00) | 469.6 (139.9) | 24.5 (1.6) | 8.2 (1.0) | 2.29 (0.28) | 29% | 2.56 (0.48) |


