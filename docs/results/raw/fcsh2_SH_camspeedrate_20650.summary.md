# DART ablation summary

Sweep: camspeedrate = 20650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.48 (0.39) | 111.13 (31.50) | 4.07 (0.91) | 245 (190) | 2.99 (0.93) | 294.2 (231.7) | 23.0 (1.7) | 12.6 (2.1) | 2.07 (0.29) | 29% | 2.24 (0.51) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.60 (0.41) | 88.46 (24.42) | 4.55 (0.77) | 373 (181) | 5.01 (0.01) | 447.0 (218.8) | 23.9 (1.6) | 14.1 (1.7) | 2.18 (0.30) | 27% | 2.41 (0.53) |


