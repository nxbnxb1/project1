# DART ablation summary

Sweep: camspeedrate = 11530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.32 (1.06) | 47.64 (19.49) | 8.10 (2.10) | 84 (57) | 1.80 (0.41) | 102.0 (68.5) | 23.6 (0.9) | 4.8 (1.6) | 2.01 (0.22) | 28% | 2.82 (1.43) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.21 (1.13) | 46.78 (14.83) | 7.66 (1.95) | 132 (50) | 2.95 (0.01) | 160.6 (61.3) | 23.7 (1.2) | 5.0 (1.6) | 2.06 (0.25) | 31% | 2.61 (1.32) |


