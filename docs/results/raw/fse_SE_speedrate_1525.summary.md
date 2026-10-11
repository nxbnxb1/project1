# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 3.00 (1.88) | 26.39 (9.69) | 8.32 (2.30) | 47 (32) | 1.56 (0.38) | 56.2 (37.7) | 23.6 (2.0) | 5.1 (3.1) | 2.09 (0.43) | 30% | 3.43 (2.34) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.60 (1.52) | 28.02 (12.02) | 8.01 (2.43) | 72 (31) | 2.52 (0.01) | 86.8 (37.1) | 23.8 (2.1) | 5.1 (3.1) | 2.13 (0.45) | 31% | 3.56 (2.47) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.40 (1.34) | 31.34 (17.96) | 8.01 (2.43) | 61 (41) | 1.86 (0.15) | 72.7 (49.1) | 23.4 (2.0) | 5.0 (3.3) | 2.05 (0.44) | 31% | 3.62 (2.59) |


