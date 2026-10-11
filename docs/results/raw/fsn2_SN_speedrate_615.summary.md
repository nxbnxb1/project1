# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.17 (0.39) | 68.74 (18.48) | 4.94 (0.87) | 64 (30) | 0.92 (0.25) | 76.0 (35.6) | 19.1 (3.3) | 8.0 (4.2) | 1.35 (0.59) | 14% | 2.35 (0.68) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 1.05 (0.46) | 61.04 (9.90) | 5.31 (0.53) | 86 (21) | 1.50 (0.01) | 102.9 (25.6) | 18.6 (2.6) | 7.5 (3.2) | 1.26 (0.46) | 10% | 2.30 (0.70) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.12 (0.52) | 63.99 (12.41) | 5.28 (0.57) | 71 (21) | 1.12 (0.07) | 83.9 (24.5) | 18.4 (2.8) | 7.1 (3.5) | 1.23 (0.49) | 11% | 2.35 (0.72) |


