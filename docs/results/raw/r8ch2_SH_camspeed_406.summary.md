# DART ablation summary

Sweep: camspeed = 406

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 0% [0, 20] | 0.99 (0.39) | 106.12 (28.79) | 3.87 (1.02) | 183 (47) | 1.64 (0.37) | 880.6 (221.4) | 23.4 (2.2) | 5.4 (1.0) | 2.16 (0.36) | 32% | 2.57 (0.57) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 0% [0, 20] | 1.12 (0.26) | 103.69 (20.68) | 4.26 (0.83) | 287 (63) | 2.69 (0.02) | 1374.0 (295.9) | 23.1 (1.2) | 5.3 (0.4) | 2.07 (0.21) | 29% | 2.68 (0.36) |


