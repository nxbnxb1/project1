# DART ablation summary

Sweep: camspeedrate = 20635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.42 (0.41) | 121.27 (26.06) | 3.45 (0.87) | 256 (152) | 2.26 (0.55) | 306.5 (180.0) | 22.6 (1.9) | 6.6 (1.2) | 2.03 (0.32) | 32% | 2.35 (0.45) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.41 (0.36) | 116.92 (40.17) | 3.60 (0.86) | 360 (158) | 3.45 (0.00) | 432.2 (190.4) | 24.5 (1.0) | 8.6 (0.6) | 2.32 (0.19) | 37% | 2.49 (0.50) |


