# DART ablation summary

Sweep: camspeedrate = 21050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.39 (0.37) | 98.60 (39.75) | 3.95 (1.60) | 323 (172) | 3.64 (0.64) | 388.8 (207.7) | 24.1 (2.8) | 13.6 (2.1) | 2.30 (0.45) | 46% | 2.21 (0.42) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.70 (0.51) | 88.94 (28.75) | 4.87 (1.08) | 396 (187) | 5.01 (0.01) | 476.3 (224.0) | 24.8 (1.1) | 14.4 (1.7) | 2.40 (0.20) | 45% | 2.53 (0.61) |


