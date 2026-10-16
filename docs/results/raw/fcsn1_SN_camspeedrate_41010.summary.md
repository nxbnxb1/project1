# DART ablation summary

Sweep: camspeedrate = 41010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.30 (0.70) | 59.57 (21.68) | 6.30 (1.83) | 50 (22) | 0.79 (0.08) | 239.0 (107.2) | 23.5 (2.0) | 7.1 (2.9) | 2.02 (0.44) | 34% | 2.21 (0.69) |
| FR_SAFE | 30 | 83% [66, 93] | 13% [5, 30] | 1.36 (0.90) | 53.68 (22.36) | 6.80 (2.12) | 54 (24) | 1.01 (0.01) | 260.1 (118.5) | 23.7 (2.2) | 7.1 (3.3) | 2.03 (0.50) | 31% | 2.39 (0.73) |


