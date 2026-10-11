# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.37 (0.33) | 49.64 (19.92) | 7.31 (1.65) | 69 (42) | 1.31 (0.25) | 83.1 (50.2) | 23.2 (1.9) | 9.3 (4.1) | 1.91 (0.44) | 24% | 2.61 (0.80) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.24 (0.43) | 43.78 (12.00) | 7.76 (1.24) | 88 (24) | 2.01 (0.01) | 106.0 (29.7) | 23.1 (1.9) | 9.7 (4.2) | 1.89 (0.43) | 25% | 2.77 (0.72) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.26 (0.46) | 49.24 (17.41) | 7.22 (1.72) | 73 (34) | 1.49 (0.16) | 87.8 (41.0) | 23.7 (2.0) | 10.1 (4.5) | 2.01 (0.47) | 29% | 2.76 (0.97) |


