# DART ablation summary

Sweep: camspeedrate = 41515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.62 (0.52) | 83.65 (31.71) | 5.16 (1.17) | 85 (57) | 1.24 (0.14) | 409.2 (279.4) | 26.1 (0.7) | 14.9 (1.6) | 2.63 (0.16) | 50% | 2.12 (0.72) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.84 (0.62) | 83.40 (27.05) | 4.82 (1.36) | 117 (47) | 1.50 (0.01) | 564.1 (220.5) | 26.6 (1.2) | 15.8 (2.1) | 2.70 (0.24) | 57% | 2.28 (0.41) |


