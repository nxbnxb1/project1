# DART ablation summary

Sweep: camspeedrate = 41535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.47 (0.49) | 40.20 (12.42) | 8.62 (1.75) | 75 (34) | 1.81 (0.25) | 363.5 (168.1) | 24.7 (1.0) | 10.4 (4.0) | 2.27 (0.22) | 32% | 2.53 (0.75) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.22 (0.53) | 39.80 (11.15) | 8.87 (1.75) | 111 (34) | 2.84 (0.04) | 532.5 (163.2) | 24.6 (1.1) | 10.2 (4.3) | 2.23 (0.25) | 34% | 2.68 (0.94) |


