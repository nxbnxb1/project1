# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.41 (0.62) | 39.60 (10.34) | 8.55 (1.70) | 59 (20) | 1.47 (0.15) | 70.1 (23.7) | 24.8 (1.3) | 7.0 (2.7) | 2.27 (0.27) | 31% | 2.27 (0.66) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.50 (0.40) | 39.59 (11.49) | 8.61 (1.69) | 80 (23) | 2.01 (0.01) | 94.5 (26.9) | 24.4 (1.1) | 6.7 (2.6) | 2.21 (0.23) | 32% | 2.30 (0.73) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.26 (0.49) | 39.67 (14.00) | 8.61 (1.75) | 64 (26) | 1.66 (0.08) | 76.6 (29.9) | 24.8 (1.3) | 6.7 (2.7) | 2.28 (0.29) | 34% | 2.23 (0.76) |


