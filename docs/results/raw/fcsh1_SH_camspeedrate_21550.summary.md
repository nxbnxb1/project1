# DART ablation summary

Sweep: camspeedrate = 21550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 27% [11, 52] | 0.38 (0.35) | 104.22 (42.19) | 4.49 (1.24) | 307 (216) | 3.65 (0.50) | 369.4 (259.3) | 24.1 (1.8) | 9.4 (1.0) | 2.29 (0.28) | 45% | 2.23 (0.56) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.59 (0.46) | 88.55 (26.54) | 4.85 (1.24) | 383 (173) | 5.01 (0.01) | 460.1 (209.3) | 24.6 (1.0) | 9.9 (1.3) | 2.36 (0.18) | 43% | 2.45 (0.57) |


