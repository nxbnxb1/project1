# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 70% [48, 85] | 25% [11, 47] | 0.92 (0.93) | 60.99 (23.51) | 5.92 (2.10) | 29 (16) | 0.48 (0.02) | 35.8 (18.8) | 22.2 (2.1) | 8.2 (3.9) | 1.79 (0.48) | 29% | 2.28 (0.77) |
| FR_SAFE | 20 | 50% [30, 70] | 40% [22, 61] | 0.69 (0.87) | 59.50 (25.04) | 6.39 (1.92) | 24 (15) | 0.52 (0.03) | 29.3 (18.5) | 22.6 (2.2) | 8.0 (3.3) | 1.83 (0.49) | 24% | 2.33 (0.64) |
| E_DART | 20 | 60% [39, 78] | 35% [18, 57] | 0.78 (0.95) | 57.57 (24.65) | 6.48 (1.75) | 26 (16) | 0.51 (0.02) | 31.2 (18.9) | 21.8 (2.4) | 7.3 (3.5) | 1.69 (0.50) | 23% | 2.46 (1.00) |


