# DART ablation summary

Sweep: camspeedrate = 11545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.52 (0.43) | 114.53 (46.61) | 4.29 (1.61) | 322 (206) | 3.21 (0.51) | 393.4 (253.0) | 24.6 (1.8) | 13.3 (1.8) | 2.37 (0.30) | 52% | 2.19 (0.46) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.67 (0.60) | 85.01 (26.47) | 4.93 (0.94) | 331 (147) | 4.36 (0.01) | 404.9 (182.7) | 25.2 (0.6) | 13.9 (1.1) | 2.46 (0.11) | 50% | 2.21 (0.49) |


