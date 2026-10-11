# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.77 (1.70) | 26.31 (8.45) | 8.42 (2.08) | 61 (39) | 2.13 (0.74) | 73.3 (45.2) | 23.4 (1.8) | 8.9 (5.4) | 2.06 (0.40) | 29% | 3.50 (2.70) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.58 (1.80) | 26.45 (8.05) | 8.33 (1.93) | 106 (32) | 4.02 (0.02) | 127.0 (37.8) | 23.5 (1.7) | 9.1 (5.4) | 2.08 (0.38) | 29% | 3.58 (2.61) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.69 (1.70) | 29.99 (17.58) | 8.21 (2.42) | 79 (53) | 2.56 (0.27) | 94.7 (63.1) | 23.3 (1.8) | 8.6 (5.3) | 2.04 (0.41) | 29% | 3.87 (2.60) |


