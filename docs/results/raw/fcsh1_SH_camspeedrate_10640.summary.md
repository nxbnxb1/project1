# DART ablation summary

Sweep: camspeedrate = 10640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 27% [11, 52] | 0.64 (0.49) | 97.44 (34.13) | 3.75 (1.01) | 218 (142) | 2.39 (0.71) | 267.3 (177.5) | 23.5 (1.2) | 7.3 (1.4) | 2.16 (0.24) | 38% | 2.27 (0.70) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.60 (0.47) | 117.01 (43.28) | 3.51 (1.00) | 421 (175) | 4.01 (0.00) | 514.9 (214.3) | 23.6 (1.5) | 8.6 (0.6) | 2.19 (0.23) | 35% | 2.22 (0.58) |


