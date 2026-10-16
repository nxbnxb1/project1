# DART ablation summary

Sweep: camspeedrate = 11020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.50 (1.92) | 39.53 (28.43) | 6.99 (2.54) | 53 (57) | 1.03 (0.47) | 64.8 (70.7) | 21.9 (2.9) | 4.7 (3.6) | 1.72 (0.67) | 23% | 3.94 (2.71) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.79 (1.91) | 33.55 (17.72) | 7.18 (2.35) | 68 (38) | 2.02 (0.01) | 84.0 (46.0) | 21.8 (2.7) | 4.8 (3.4) | 1.70 (0.62) | 22% | 3.78 (2.86) |


