# DART ablation summary

Sweep: camspeedrate = 21035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.37 (0.42) | 93.58 (37.69) | 4.89 (1.25) | 174 (121) | 2.44 (0.47) | 206.9 (147.0) | 24.0 (1.5) | 11.3 (1.4) | 2.24 (0.25) | 44% | 2.14 (0.68) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.59 (0.49) | 88.04 (23.65) | 4.58 (1.19) | 286 (135) | 3.46 (0.02) | 341.6 (161.7) | 24.8 (1.1) | 13.2 (1.5) | 2.40 (0.18) | 45% | 2.13 (0.50) |


