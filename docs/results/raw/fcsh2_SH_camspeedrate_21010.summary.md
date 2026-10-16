# DART ablation summary

Sweep: camspeedrate = 21010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 13% [4, 38] | 87% [62, 96] | 0.09 (0.30) | 80.48 (5.73) | 6.05 (1.59) | 29 (26) | 0.92 (0.11) | 34.8 (31.9) | 22.3 (2.0) | 8.3 (2.5) | 1.89 (0.38) | 35% | 2.15 (0.82) |
| FR_SAFE | 15 | 13% [4, 38] | 80% [55, 93] | 0.05 (0.24) | 94.05 (34.32) | 5.17 (1.87) | 46 (39) | 1.04 (0.06) | 54.1 (45.6) | 23.4 (2.5) | 9.8 (3.5) | 2.13 (0.46) | 44% | 2.26 (0.75) |


