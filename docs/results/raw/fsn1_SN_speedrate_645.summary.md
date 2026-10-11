# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.10 (0.50) | 66.10 (16.44) | 5.15 (0.73) | 145 (84) | 2.07 (0.72) | 175.3 (101.8) | 18.9 (3.2) | 6.2 (3.0) | 1.29 (0.56) | 13% | 2.99 (0.74) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 0.91 (0.47) | 59.55 (9.06) | 5.46 (0.34) | 250 (51) | 4.36 (0.01) | 301.5 (62.4) | 18.5 (3.0) | 6.2 (2.8) | 1.22 (0.52) | 10% | 2.96 (1.04) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 0.97 (0.50) | 59.75 (6.70) | 5.37 (0.41) | 100 (35) | 1.66 (0.36) | 119.7 (41.6) | 18.6 (3.0) | 6.0 (2.9) | 1.24 (0.51) | 10% | 2.85 (1.28) |


