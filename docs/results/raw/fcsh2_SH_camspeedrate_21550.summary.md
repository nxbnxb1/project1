# DART ablation summary

Sweep: camspeedrate = 21550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.42 (0.43) | 74.79 (20.49) | 5.42 (0.91) | 205 (114) | 3.34 (0.71) | 244.3 (138.1) | 24.9 (0.7) | 12.6 (1.7) | 2.39 (0.14) | 46% | 2.06 (0.47) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.59 (0.38) | 80.09 (14.12) | 4.77 (0.72) | 391 (111) | 5.01 (0.01) | 469.2 (132.5) | 25.1 (1.7) | 14.6 (1.9) | 2.45 (0.28) | 51% | 2.46 (0.63) |


