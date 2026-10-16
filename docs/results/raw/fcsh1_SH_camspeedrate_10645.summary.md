# DART ablation summary

Sweep: camspeedrate = 10645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.46 (0.42) | 129.44 (44.53) | 3.33 (0.98) | 333 (187) | 2.80 (0.69) | 408.6 (232.6) | 23.4 (1.6) | 13.6 (1.9) | 2.17 (0.27) | 40% | 2.20 (0.45) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.59 (0.41) | 115.98 (48.92) | 3.80 (0.97) | 453 (217) | 4.35 (0.00) | 553.1 (268.6) | 24.0 (1.2) | 14.6 (1.1) | 2.22 (0.19) | 33% | 2.43 (0.42) |


