# DART ablation summary

Sweep: camspeedrate = 41515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.29 (1.14) | 43.92 (13.27) | 8.02 (1.94) | 49 (19) | 1.18 (0.13) | 234.1 (94.3) | 24.9 (1.0) | 7.0 (2.2) | 2.29 (0.23) | 33% | 2.29 (1.09) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.65 (1.65) | 45.81 (17.50) | 7.74 (2.22) | 72 (38) | 1.51 (0.02) | 345.7 (187.5) | 24.9 (1.3) | 7.2 (2.6) | 2.31 (0.30) | 38% | 2.32 (1.27) |


