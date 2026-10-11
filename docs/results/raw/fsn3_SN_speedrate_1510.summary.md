# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 90% [70, 97] | 5% [1, 24] | 1.18 (0.70) | 42.34 (9.26) | 7.61 (2.08) | 37 (14) | 0.87 (0.06) | 45.7 (18.4) | 24.7 (1.3) | 9.5 (3.0) | 2.25 (0.29) | 35% | 2.22 (0.95) |
| FR_SAFE | 20 | 85% [64, 95] | 15% [5, 36] | 1.08 (0.77) | 49.20 (15.20) | 6.84 (2.00) | 46 (16) | 1.01 (0.01) | 56.1 (19.9) | 25.0 (1.6) | 10.5 (3.0) | 2.33 (0.32) | 39% | 2.35 (0.89) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.21 (1.04) | 55.02 (27.45) | 6.65 (2.22) | 56 (27) | 1.01 (0.01) | 68.9 (31.3) | 24.9 (1.5) | 10.3 (2.8) | 2.30 (0.32) | 40% | 2.37 (0.83) |


