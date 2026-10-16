# DART ablation summary

Sweep: camspeedrate = 40610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.27 (0.75) | 71.81 (31.81) | 4.86 (1.12) | 51 (39) | 0.62 (0.17) | 247.8 (187.1) | 19.3 (3.5) | 7.8 (4.5) | 1.39 (0.64) | 17% | 2.31 (0.64) |
| FR_SAFE | 30 | 93% [79, 98] | 0% [0, 11] | 1.18 (0.68) | 74.72 (28.11) | 4.71 (1.05) | 81 (35) | 1.01 (0.00) | 387.0 (169.3) | 19.7 (3.4) | 8.9 (4.5) | 1.48 (0.62) | 19% | 2.51 (0.78) |


