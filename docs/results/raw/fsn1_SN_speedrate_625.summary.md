# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.24 (0.41) | 64.73 (12.44) | 5.18 (0.60) | 89 (40) | 1.33 (0.41) | 107.5 (48.5) | 19.1 (3.2) | 6.2 (2.9) | 1.34 (0.55) | 11% | 2.65 (0.91) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.13 (0.41) | 67.57 (13.47) | 5.07 (0.63) | 169 (34) | 2.51 (0.00) | 204.4 (41.1) | 19.3 (3.0) | 6.8 (2.9) | 1.38 (0.54) | 14% | 3.02 (1.06) |
| E_DART | 20 | 95% [76, 99] | 0% [0, 16] | 0.98 (0.41) | 68.72 (16.27) | 4.80 (0.97) | 103 (41) | 1.43 (0.23) | 123.7 (50.7) | 19.7 (3.3) | 6.9 (3.3) | 1.46 (0.59) | 17% | 2.75 (0.75) |


