# DART ablation summary

Sweep: camspeedrate = 11535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.46 (0.38) | 94.14 (34.52) | 4.80 (1.38) | 209 (123) | 2.54 (0.45) | 254.1 (149.9) | 23.6 (1.5) | 8.4 (0.9) | 2.19 (0.23) | 43% | 2.07 (0.52) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.60 (0.39) | 88.91 (48.09) | 4.87 (1.15) | 297 (156) | 3.45 (0.01) | 364.1 (193.1) | 24.7 (1.3) | 10.0 (0.8) | 2.39 (0.20) | 48% | 2.06 (0.35) |


