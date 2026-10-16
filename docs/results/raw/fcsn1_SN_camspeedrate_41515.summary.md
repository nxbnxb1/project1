# DART ablation summary

Sweep: camspeedrate = 41515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.46 (0.68) | 43.71 (17.77) | 8.50 (1.95) | 49 (26) | 1.14 (0.12) | 236.9 (122.4) | 24.5 (1.2) | 9.2 (3.8) | 2.21 (0.26) | 31% | 2.46 (0.92) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.33 (0.79) | 49.49 (23.57) | 7.80 (2.34) | 72 (36) | 1.51 (0.02) | 345.9 (176.2) | 24.7 (1.4) | 10.1 (4.4) | 2.27 (0.31) | 36% | 2.41 (1.03) |


