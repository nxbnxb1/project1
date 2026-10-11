# DART ablation summary

Sweep: camspeed = 115

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 70% [52, 83] | 17% [7, 34] | 1.41 (1.04) | 53.79 (35.63) | 6.37 (2.84) | 83 (34) | 1.50 (0.51) | 101.3 (41.4) | 21.2 (2.9) | 2.5 (0.7) | 1.67 (0.40) | 29% | 2.67 (1.31) |
| FR_SAFE_3 | 30 | 93% [79, 98] | 3% [1, 17] | 1.34 (1.13) | 55.81 (24.69) | 7.31 (2.22) | 167 (80) | 2.95 (0.01) | 204.5 (98.1) | 22.1 (1.2) | 2.6 (0.7) | 1.79 (0.21) | 32% | 2.83 (1.35) |


