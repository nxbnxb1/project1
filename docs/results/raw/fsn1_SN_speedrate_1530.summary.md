# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.37 (0.52) | 39.05 (8.86) | 8.63 (1.53) | 77 (22) | 1.95 (0.23) | 93.3 (26.4) | 24.5 (1.1) | 9.7 (3.8) | 2.22 (0.24) | 29% | 2.73 (0.92) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.36 (0.59) | 38.67 (10.25) | 8.74 (1.65) | 114 (30) | 2.95 (0.01) | 137.5 (37.8) | 24.7 (1.1) | 10.0 (3.7) | 2.27 (0.24) | 31% | 2.84 (0.82) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.02 (0.52) | 39.80 (13.12) | 8.80 (2.10) | 84 (28) | 2.21 (0.16) | 101.0 (32.8) | 24.8 (0.9) | 9.3 (3.7) | 2.28 (0.19) | 30% | 2.62 (1.06) |


