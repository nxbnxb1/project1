# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 0% [0, 16] | 1.31 (0.55) | 48.52 (25.06) | 7.67 (2.79) | 81 (50) | 1.56 (0.17) | 98.3 (60.1) | 25.2 (1.2) | 11.2 (4.5) | 2.39 (0.28) | 37% | 2.56 (1.14) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.24 (0.50) | 40.81 (15.46) | 8.23 (2.00) | 85 (34) | 2.01 (0.01) | 103.0 (40.2) | 25.0 (1.1) | 10.8 (4.3) | 2.32 (0.24) | 34% | 2.74 (0.83) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.22 (0.84) | 42.73 (19.15) | 8.80 (2.43) | 67 (36) | 1.69 (0.08) | 81.2 (42.4) | 24.9 (1.0) | 10.1 (4.2) | 2.31 (0.22) | 33% | 2.44 (0.73) |


