# DART ablation summary

Sweep: camspeedrate = 11535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.58 (1.47) | 33.87 (21.04) | 7.75 (2.66) | 71 (76) | 1.60 (0.70) | 87.4 (94.2) | 22.3 (1.7) | 5.1 (3.5) | 1.81 (0.42) | 25% | 3.74 (2.79) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.69 (1.77) | 35.74 (24.83) | 7.82 (2.59) | 125 (84) | 3.47 (0.02) | 153.9 (103.3) | 22.3 (1.7) | 5.4 (3.8) | 1.81 (0.42) | 27% | 3.98 (2.70) |


