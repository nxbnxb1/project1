# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.69 (0.30) | 68.28 (6.15) | 4.99 (0.31) | 168 (68) | 2.67 (0.99) | 201.4 (83.6) | 25.2 (1.2) | 8.6 (0.8) | 2.37 (0.23) | 18% | 1.95 (0.41) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.68 (0.28) | 72.61 (9.56) | 4.83 (0.40) | 311 (42) | 4.35 (0.00) | 371.9 (52.7) | 25.1 (0.9) | 9.0 (0.6) | 2.37 (0.17) | 23% | 2.37 (0.52) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.50 (0.49) | 83.08 (28.68) | 4.61 (0.84) | 181 (85) | 2.49 (0.27) | 217.5 (99.8) | 24.9 (1.6) | 8.4 (0.8) | 2.33 (0.26) | 23% | 2.13 (0.43) |


