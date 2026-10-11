# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.59 (0.83) | 45.67 (27.96) | 8.30 (2.02) | 38 (27) | 0.84 (0.06) | 45.1 (31.9) | 24.1 (1.5) | 6.2 (2.7) | 2.10 (0.32) | 29% | 2.09 (0.49) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.25 (0.72) | 49.39 (24.06) | 7.62 (2.18) | 50 (24) | 1.01 (0.01) | 59.2 (28.6) | 24.3 (1.3) | 6.6 (2.7) | 2.17 (0.32) | 34% | 2.04 (0.61) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.05 (0.74) | 45.95 (19.12) | 7.84 (1.87) | 46 (19) | 1.01 (0.01) | 53.8 (22.1) | 24.3 (1.4) | 6.5 (2.7) | 2.16 (0.32) | 34% | 1.96 (0.53) |


