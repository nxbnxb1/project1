# DART ablation summary

Sweep: camspeedrate = 41015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.51 (0.48) | 98.86 (29.49) | 4.60 (1.44) | 113 (55) | 1.28 (0.10) | 544.3 (259.2) | 26.4 (1.1) | 15.6 (2.2) | 2.66 (0.22) | 51% | 1.89 (0.46) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.69 (0.53) | 76.44 (13.50) | 5.26 (1.39) | 99 (41) | 1.51 (0.03) | 480.0 (199.2) | 26.2 (1.1) | 15.1 (2.2) | 2.62 (0.20) | 47% | 2.01 (0.44) |


