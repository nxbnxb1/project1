# DART ablation summary

Sweep: camspeedrate = 41535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.51 (2.43) | 29.17 (14.40) | 8.39 (2.33) | 49 (40) | 1.49 (0.44) | 235.2 (194.2) | 23.0 (1.7) | 7.8 (5.3) | 1.96 (0.38) | 27% | 3.83 (2.94) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 3.50 (2.34) | 27.97 (13.28) | 8.34 (2.31) | 79 (37) | 2.85 (0.06) | 382.0 (177.7) | 23.2 (1.8) | 8.3 (5.5) | 2.00 (0.40) | 28% | 3.66 (2.59) |


