# DART ablation summary

Sweep: camspeedrate = 21545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 33% [15, 58] | 0.40 (0.48) | 84.57 (27.24) | 4.79 (1.25) | 213 (131) | 3.06 (0.71) | 256.4 (155.7) | 24.4 (1.6) | 14.0 (2.3) | 2.31 (0.26) | 47% | 2.45 (0.84) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.67 (0.44) | 90.17 (25.64) | 4.37 (1.01) | 367 (137) | 4.36 (0.02) | 441.2 (165.3) | 25.7 (1.6) | 16.8 (2.6) | 2.56 (0.28) | 53% | 2.17 (0.47) |


