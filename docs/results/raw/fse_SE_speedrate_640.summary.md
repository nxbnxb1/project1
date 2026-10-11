# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.36 (0.97) | 39.99 (13.22) | 5.36 (0.73) | 80 (70) | 1.84 (1.06) | 94.9 (82.3) | 19.3 (4.9) | 8.6 (5.8) | 1.41 (0.87) | 8% | 3.72 (2.76) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.12 (0.85) | 37.76 (6.37) | 5.46 (0.50) | 152 (26) | 4.01 (0.01) | 182.0 (31.7) | 19.4 (4.8) | 9.0 (5.7) | 1.44 (0.85) | 8% | 3.88 (2.67) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.21 (1.06) | 36.97 (2.83) | 5.53 (0.23) | 68 (28) | 1.80 (0.65) | 80.9 (32.3) | 19.2 (4.8) | 8.4 (5.6) | 1.40 (0.85) | 6% | 3.52 (2.64) |


