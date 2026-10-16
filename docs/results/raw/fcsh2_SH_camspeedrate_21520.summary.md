# DART ablation summary

Sweep: camspeedrate = 21520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 60% [36, 80] | 0.17 (0.30) | 110.35 (38.07) | 4.78 (2.01) | 116 (102) | 1.63 (0.24) | 139.4 (122.9) | 23.0 (1.6) | 9.8 (2.1) | 2.07 (0.27) | 41% | 1.90 (0.71) |
| FR_SAFE | 15 | 13% [4, 38] | 80% [55, 93] | 0.08 (0.28) | 66.53 (5.45) | 5.14 (1.89) | 82 (62) | 2.03 (0.04) | 97.1 (74.8) | 24.6 (1.7) | 11.9 (2.3) | 2.34 (0.26) | 45% | 2.01 (0.77) |


