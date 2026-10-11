# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.61 (1.25) | 26.94 (6.10) | 7.80 (1.31) | 70 (47) | 2.37 (1.20) | 83.0 (55.8) | 22.4 (2.8) | 8.5 (5.2) | 1.81 (0.66) | 24% | 3.63 (2.49) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.34 (1.44) | 28.20 (8.14) | 7.65 (1.42) | 141 (41) | 5.02 (0.01) | 169.7 (48.5) | 22.6 (3.0) | 9.0 (5.6) | 1.85 (0.69) | 27% | 3.71 (2.53) |
| E_DART | 30 | 97% [83, 99] | 3% [1, 17] | 2.31 (1.39) | 26.93 (5.45) | 7.65 (1.48) | 70 (39) | 2.36 (0.87) | 84.1 (45.7) | 22.1 (2.7) | 8.1 (5.2) | 1.74 (0.62) | 23% | 3.47 (2.78) |


