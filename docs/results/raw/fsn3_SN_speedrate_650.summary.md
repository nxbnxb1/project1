# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 0.92 (0.32) | 59.51 (5.80) | 5.46 (0.28) | 146 (45) | 2.42 (0.63) | 175.3 (53.1) | 18.9 (2.1) | 5.5 (1.7) | 1.29 (0.35) | 7% | 2.55 (0.80) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 0.85 (0.52) | 61.55 (8.69) | 5.37 (0.40) | 287 (77) | 5.01 (0.00) | 344.9 (93.6) | 19.5 (2.3) | 6.6 (2.1) | 1.39 (0.40) | 11% | 3.07 (1.17) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 0.93 (0.52) | 60.78 (9.74) | 5.33 (0.52) | 105 (39) | 1.89 (0.43) | 126.4 (47.0) | 19.5 (2.8) | 6.1 (2.3) | 1.39 (0.49) | 10% | 2.43 (1.00) |


