# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.22 (0.45) | 45.41 (18.04) | 7.61 (1.37) | 121 (76) | 2.54 (0.54) | 145.5 (92.0) | 23.3 (1.3) | 10.4 (2.8) | 1.95 (0.30) | 25% | 2.74 (1.29) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.23 (0.47) | 43.50 (9.04) | 7.67 (1.15) | 190 (39) | 4.36 (0.01) | 227.9 (46.6) | 23.7 (1.5) | 10.7 (3.0) | 2.01 (0.34) | 27% | 2.83 (0.92) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.17 (0.65) | 46.60 (17.61) | 7.53 (1.55) | 107 (60) | 2.30 (0.38) | 128.4 (71.3) | 23.4 (1.5) | 10.2 (3.1) | 1.95 (0.35) | 26% | 2.45 (0.99) |


