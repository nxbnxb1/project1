# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.91 (1.83) | 30.35 (15.17) | 7.94 (2.64) | 35 (22) | 1.09 (0.15) | 41.9 (25.5) | 23.3 (1.8) | 6.0 (3.7) | 2.04 (0.41) | 30% | 3.44 (2.52) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.79 (1.87) | 34.87 (25.11) | 7.80 (2.85) | 53 (37) | 1.51 (0.01) | 62.9 (43.6) | 23.8 (2.3) | 6.2 (4.2) | 2.12 (0.50) | 34% | 3.34 (2.44) |
| E_DART | 30 | 97% [83, 99] | 3% [1, 17] | 2.38 (1.51) | 33.12 (26.20) | 7.79 (2.58) | 43 (36) | 1.31 (0.04) | 51.9 (42.8) | 23.3 (1.8) | 6.0 (3.8) | 2.03 (0.40) | 30% | 3.54 (2.49) |


