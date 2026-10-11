# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 90% [70, 97] | 10% [3, 30] | 1.24 (0.64) | 41.79 (8.69) | 7.83 (1.11) | 85 (33) | 2.01 (0.52) | 102.4 (39.5) | 23.2 (1.9) | 4.9 (2.1) | 1.91 (0.42) | 24% | 2.69 (0.74) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.23 (0.61) | 44.32 (12.06) | 7.71 (1.31) | 151 (42) | 3.46 (0.01) | 182.5 (50.4) | 23.1 (2.0) | 5.1 (2.0) | 1.89 (0.43) | 26% | 2.74 (1.07) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.10 (0.54) | 44.07 (15.86) | 7.80 (1.53) | 86 (40) | 1.90 (0.31) | 104.2 (47.6) | 22.9 (1.7) | 5.0 (2.0) | 1.86 (0.40) | 24% | 2.74 (0.99) |


