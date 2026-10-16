# DART ablation summary

Sweep: camspeedrate = 20625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.23 (1.28) | 62.09 (42.18) | 4.65 (1.46) | 86 (111) | 1.00 (0.70) | 102.4 (132.7) | 18.8 (4.7) | 7.3 (5.7) | 1.34 (0.85) | 16% | 3.57 (2.32) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.35 (1.43) | 51.92 (33.69) | 4.88 (1.24) | 134 (85) | 2.51 (0.01) | 160.4 (102.5) | 19.4 (4.9) | 8.2 (5.9) | 1.44 (0.87) | 15% | 4.19 (2.85) |


