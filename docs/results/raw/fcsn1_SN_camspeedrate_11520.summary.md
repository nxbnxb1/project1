# DART ablation summary

Sweep: camspeedrate = 11520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 27% [14, 44] | 1.03 (0.92) | 42.24 (15.81) | 7.64 (2.47) | 70 (54) | 1.39 (0.28) | 85.3 (65.7) | 23.1 (2.1) | 4.1 (1.6) | 1.94 (0.35) | 28% | 2.68 (0.71) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.29 (0.83) | 49.24 (30.29) | 8.22 (2.23) | 92 (61) | 2.01 (0.01) | 112.7 (73.8) | 23.5 (1.4) | 4.1 (1.8) | 1.99 (0.29) | 27% | 2.73 (2.02) |


