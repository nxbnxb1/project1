# DART ablation summary

Sweep: camspeedrate = 41015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.67 (0.52) | 91.97 (31.58) | 4.39 (1.21) | 97 (55) | 1.31 (0.17) | 466.4 (264.2) | 26.1 (2.1) | 8.4 (1.1) | 2.62 (0.41) | 51% | 1.98 (0.47) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.74 (0.52) | 91.17 (17.53) | 4.60 (1.30) | 128 (42) | 1.50 (0.01) | 616.8 (199.6) | 26.2 (1.4) | 8.4 (1.2) | 2.63 (0.29) | 53% | 2.04 (0.52) |


