# DART ablation summary

Sweep: camspeedrate = 41005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 67% [42, 85] | 0.17 (0.39) | 98.31 (33.76) | 4.35 (1.43) | 33 (24) | 0.51 (0.05) | 157.4 (120.8) | 25.1 (1.3) | 7.5 (1.1) | 2.47 (0.22) | 51% | 1.89 (0.35) |
| FR_SAFE | 15 | 27% [11, 52] | 73% [48, 89] | 0.10 (0.34) | 111.83 (26.46) | 3.93 (1.74) | 38 (27) | 0.52 (0.02) | 182.8 (125.9) | 24.8 (1.9) | 8.1 (1.3) | 2.38 (0.36) | 45% | 2.17 (0.52) |


