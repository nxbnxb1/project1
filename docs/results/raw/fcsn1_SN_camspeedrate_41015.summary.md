# DART ablation summary

Sweep: camspeedrate = 41015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.21 (0.76) | 55.82 (25.43) | 6.84 (1.99) | 59 (36) | 1.06 (0.20) | 283.7 (174.3) | 23.6 (1.9) | 9.7 (4.3) | 2.01 (0.44) | 31% | 2.61 (1.13) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.11 (0.50) | 54.42 (29.41) | 6.93 (1.94) | 84 (45) | 1.50 (0.01) | 404.3 (216.7) | 23.4 (2.0) | 9.4 (4.2) | 1.98 (0.46) | 31% | 2.50 (1.00) |


