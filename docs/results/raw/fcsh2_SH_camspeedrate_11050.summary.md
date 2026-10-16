# DART ablation summary

Sweep: camspeedrate = 11050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.53 (0.36) | 75.11 (17.37) | 4.86 (1.01) | 270 (125) | 3.26 (0.68) | 330.6 (151.8) | 24.3 (1.4) | 12.5 (2.0) | 2.31 (0.23) | 44% | 2.16 (0.39) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.73 (0.56) | 67.66 (11.47) | 5.30 (1.30) | 310 (90) | 5.01 (0.01) | 379.2 (109.2) | 25.3 (1.0) | 14.5 (1.4) | 2.47 (0.17) | 46% | 2.12 (0.43) |


