# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.20 (1.04) | 44.67 (17.89) | 5.08 (1.00) | 52 (46) | 1.04 (0.53) | 62.3 (54.5) | 19.5 (5.2) | 8.1 (5.8) | 1.47 (0.93) | 12% | 3.78 (2.83) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.34 (1.02) | 42.92 (15.48) | 5.17 (0.84) | 86 (31) | 2.01 (0.01) | 103.2 (37.0) | 19.5 (5.1) | 8.3 (5.8) | 1.46 (0.91) | 12% | 3.76 (2.53) |
| E_DART | 30 | 97% [83, 99] | 3% [1, 17] | 2.04 (1.15) | 44.32 (16.95) | 5.11 (0.92) | 60 (36) | 1.32 (0.25) | 71.7 (42.6) | 19.5 (5.0) | 8.1 (5.6) | 1.45 (0.89) | 13% | 3.86 (2.83) |


