# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.05 (0.55) | 47.73 (12.79) | 7.06 (1.54) | 106 (50) | 2.22 (0.46) | 129.0 (60.3) | 23.8 (1.8) | 7.9 (2.3) | 2.05 (0.39) | 29% | 2.55 (0.76) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.27 (1.06) | 42.54 (7.94) | 7.71 (1.14) | 147 (27) | 3.46 (0.01) | 177.1 (32.2) | 23.7 (1.7) | 7.8 (2.4) | 2.02 (0.38) | 26% | 2.91 (0.97) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.07 (0.73) | 40.15 (5.81) | 7.83 (1.07) | 80 (22) | 2.01 (0.26) | 96.7 (26.6) | 23.6 (1.3) | 7.3 (2.2) | 1.99 (0.31) | 25% | 2.43 (1.09) |


