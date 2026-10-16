# DART ablation summary

Sweep: camspeedrate = 11010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 60% [36, 80] | 0.13 (0.24) | 121.09 (31.96) | 4.38 (1.83) | 60 (49) | 0.90 (0.08) | 74.0 (60.1) | 23.4 (1.2) | 10.2 (2.1) | 2.14 (0.27) | 43% | 1.94 (0.68) |
| FR_SAFE | 15 | 27% [11, 52] | 67% [42, 85] | 0.14 (0.35) | 88.71 (13.72) | 3.34 (1.20) | 77 (52) | 1.01 (0.01) | 93.5 (62.3) | 24.2 (1.5) | 11.7 (1.1) | 2.32 (0.25) | 48% | 2.42 (0.91) |


