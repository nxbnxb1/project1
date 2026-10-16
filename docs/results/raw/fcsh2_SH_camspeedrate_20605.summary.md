# DART ablation summary

Sweep: camspeedrate = 20605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 60% [36, 80] | 0.23 (0.32) | 130.84 (46.59) | 3.34 (1.25) | 41 (24) | 0.46 (0.05) | 47.7 (28.2) | 21.7 (2.0) | 8.3 (1.4) | 1.89 (0.32) | 33% | 1.71 (0.41) |
| FR_SAFE | 15 | 13% [4, 38] | 73% [48, 89] | 0.13 (0.30) | 209.12 (29.91) | 2.57 (0.88) | 55 (32) | 0.51 (0.02) | 65.9 (38.5) | 21.9 (1.7) | 9.5 (1.7) | 1.92 (0.29) | 35% | 2.56 (0.73) |


