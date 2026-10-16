# DART ablation summary

Sweep: camspeedrate = 11050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 3% [1, 17] | 1.37 (0.88) | 44.73 (13.13) | 7.49 (1.55) | 121 (100) | 2.38 (0.75) | 147.6 (123.9) | 22.4 (1.5) | 5.8 (1.7) | 1.78 (0.31) | 22% | 2.59 (0.88) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.51 (1.62) | 47.71 (18.43) | 7.36 (1.44) | 232 (98) | 5.01 (0.02) | 285.0 (121.0) | 23.1 (1.6) | 6.9 (2.2) | 1.92 (0.36) | 27% | 2.95 (1.24) |


