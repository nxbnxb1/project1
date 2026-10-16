# DART ablation summary

Sweep: camspeedrate = 21520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 0.98 (0.96) | 56.81 (31.45) | 6.92 (2.06) | 74 (58) | 1.32 (0.32) | 88.9 (69.1) | 22.2 (1.6) | 7.3 (3.0) | 1.76 (0.36) | 28% | 2.50 (0.78) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 0.85 (0.77) | 54.22 (26.86) | 7.32 (2.09) | 100 (55) | 2.01 (0.01) | 119.9 (66.8) | 22.3 (1.8) | 7.4 (3.1) | 1.75 (0.40) | 25% | 2.71 (1.04) |


