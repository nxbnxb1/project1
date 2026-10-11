# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.11 (0.41) | 62.98 (10.06) | 5.10 (0.82) | 44 (19) | 0.65 (0.15) | 52.3 (22.1) | 18.9 (3.2) | 7.4 (4.0) | 1.31 (0.57) | 13% | 2.04 (0.69) |
| FR_SAFE | 20 | 95% [76, 99] | 0% [0, 16] | 1.09 (0.43) | 72.96 (22.52) | 4.75 (1.06) | 76 (25) | 1.01 (0.00) | 90.3 (29.6) | 19.1 (3.3) | 8.1 (4.3) | 1.36 (0.59) | 16% | 2.21 (0.74) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.12 (0.53) | 77.52 (31.19) | 4.65 (1.21) | 75 (31) | 1.01 (0.00) | 88.6 (36.3) | 19.3 (3.2) | 7.9 (4.1) | 1.41 (0.58) | 19% | 2.28 (1.23) |


