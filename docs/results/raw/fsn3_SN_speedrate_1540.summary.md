# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.61 (1.70) | 38.85 (8.43) | 8.57 (1.47) | 100 (33) | 2.54 (0.39) | 121.1 (39.9) | 24.9 (1.1) | 10.5 (2.7) | 2.29 (0.24) | 31% | 2.76 (1.17) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.33 (0.66) | 38.99 (8.21) | 8.52 (1.24) | 156 (33) | 4.01 (0.01) | 188.0 (39.1) | 24.8 (1.2) | 10.8 (2.6) | 2.29 (0.25) | 34% | 2.79 (1.24) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.32 (1.14) | 38.70 (8.47) | 8.52 (1.49) | 108 (27) | 2.77 (0.19) | 129.8 (32.8) | 25.1 (1.0) | 10.9 (2.9) | 2.34 (0.22) | 36% | 2.72 (0.93) |


