# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.33 (0.58) | 40.60 (8.65) | 7.89 (1.25) | 53 (19) | 1.29 (0.23) | 62.7 (22.6) | 23.0 (1.6) | 6.0 (2.5) | 1.85 (0.36) | 21% | 2.24 (0.58) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.18 (0.49) | 51.64 (17.59) | 6.97 (1.79) | 104 (35) | 2.01 (0.01) | 123.3 (41.0) | 23.5 (2.2) | 7.0 (3.1) | 1.98 (0.49) | 31% | 2.31 (0.64) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.28 (0.42) | 43.01 (10.65) | 7.72 (1.28) | 62 (21) | 1.43 (0.13) | 73.8 (24.0) | 23.0 (1.6) | 6.0 (2.5) | 1.88 (0.38) | 25% | 2.23 (0.71) |


