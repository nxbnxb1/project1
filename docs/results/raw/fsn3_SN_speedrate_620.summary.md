# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 0.87 (0.57) | 66.89 (12.40) | 5.06 (0.61) | 80 (33) | 1.24 (0.29) | 97.5 (39.7) | 20.1 (2.8) | 9.0 (3.3) | 1.51 (0.49) | 14% | 2.68 (1.07) |
| FR_SAFE | 20 | 85% [64, 95] | 15% [5, 36] | 0.95 (0.82) | 59.47 (5.94) | 5.33 (0.62) | 117 (45) | 2.01 (0.02) | 141.1 (54.4) | 19.2 (2.3) | 8.4 (2.9) | 1.35 (0.40) | 11% | 3.03 (1.50) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 1.03 (0.52) | 62.79 (10.89) | 5.10 (0.73) | 86 (28) | 1.30 (0.13) | 104.7 (34.4) | 19.7 (2.6) | 8.5 (3.2) | 1.44 (0.47) | 14% | 2.66 (0.91) |


