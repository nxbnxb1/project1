# DART ablation summary

Sweep: camspeedrate = 11525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 47% [25, 70] | 0.24 (0.31) | 121.80 (28.71) | 4.25 (1.70) | 169 (112) | 2.00 (0.28) | 206.1 (137.6) | 24.1 (1.9) | 12.6 (2.8) | 2.29 (0.31) | 51% | 2.61 (1.07) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.68 (0.66) | 108.31 (28.79) | 3.97 (1.13) | 222 (102) | 2.51 (0.01) | 270.4 (125.9) | 25.1 (1.5) | 13.6 (1.4) | 2.47 (0.25) | 52% | 2.15 (0.64) |


