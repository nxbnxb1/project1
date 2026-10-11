# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.06 (0.47) | 60.78 (9.46) | 5.33 (0.52) | 131 (65) | 2.28 (0.86) | 156.4 (77.9) | 18.6 (2.8) | 7.4 (3.6) | 1.25 (0.50) | 10% | 2.42 (0.63) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 0.98 (0.24) | 59.57 (6.93) | 5.43 (0.39) | 298 (35) | 5.01 (0.01) | 354.9 (38.9) | 18.6 (2.5) | 7.9 (3.2) | 1.24 (0.43) | 10% | 2.83 (0.96) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.20 (0.23) | 58.71 (5.19) | 5.45 (0.31) | 101 (28) | 1.70 (0.34) | 120.2 (32.7) | 18.2 (2.3) | 6.7 (2.8) | 1.17 (0.39) | 8% | 1.97 (0.71) |


