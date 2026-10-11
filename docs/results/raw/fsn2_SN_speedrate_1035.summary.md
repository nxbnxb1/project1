# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.37 (0.45) | 41.12 (6.02) | 7.89 (0.99) | 82 (27) | 1.95 (0.47) | 97.8 (32.1) | 22.8 (1.7) | 8.3 (3.2) | 1.82 (0.38) | 22% | 2.35 (0.61) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.24 (0.28) | 41.00 (7.18) | 7.92 (0.94) | 142 (25) | 3.46 (0.01) | 168.3 (28.6) | 22.9 (1.6) | 8.8 (3.3) | 1.84 (0.35) | 22% | 2.32 (0.57) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.08 (0.46) | 41.80 (8.02) | 7.89 (1.07) | 79 (28) | 1.86 (0.32) | 93.6 (33.5) | 22.8 (1.8) | 8.2 (3.3) | 1.82 (0.41) | 23% | 2.36 (0.63) |


