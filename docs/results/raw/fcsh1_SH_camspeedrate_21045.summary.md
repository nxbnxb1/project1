# DART ablation summary

Sweep: camspeedrate = 21045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.67 (0.50) | 89.09 (42.03) | 4.79 (1.34) | 251 (165) | 3.05 (0.45) | 301.3 (196.7) | 24.1 (2.0) | 9.0 (1.4) | 2.26 (0.31) | 43% | 2.26 (0.50) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.87 (0.35) | 85.14 (26.11) | 4.70 (1.02) | 359 (118) | 4.35 (0.00) | 432.5 (141.2) | 25.6 (1.0) | 10.7 (1.3) | 2.53 (0.20) | 51% | 2.34 (0.56) |


