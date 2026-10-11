# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.41 (0.42) | 36.62 (9.32) | 9.04 (1.49) | 109 (49) | 2.88 (0.63) | 129.9 (57.6) | 24.4 (0.8) | 9.4 (3.4) | 2.20 (0.19) | 27% | 2.48 (0.69) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.28 (0.37) | 35.67 (8.68) | 9.17 (1.44) | 179 (43) | 5.01 (0.01) | 212.5 (50.0) | 24.6 (0.9) | 9.7 (3.5) | 2.25 (0.20) | 31% | 2.60 (0.72) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.22 (0.63) | 37.07 (8.84) | 8.99 (1.65) | 117 (39) | 3.26 (0.27) | 139.5 (45.4) | 24.7 (1.0) | 9.4 (3.4) | 2.26 (0.22) | 31% | 2.32 (0.63) |


