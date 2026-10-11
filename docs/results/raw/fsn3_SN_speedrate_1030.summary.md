# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.31 (0.80) | 44.18 (9.99) | 7.57 (1.17) | 86 (33) | 1.90 (0.34) | 104.9 (39.6) | 23.6 (1.5) | 9.6 (2.8) | 2.01 (0.34) | 26% | 2.64 (1.06) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 1.21 (1.09) | 45.71 (16.79) | 7.59 (1.59) | 133 (49) | 2.95 (0.01) | 159.9 (56.6) | 23.9 (1.7) | 9.7 (3.3) | 2.04 (0.40) | 29% | 2.65 (1.03) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.31 (0.83) | 44.57 (13.69) | 7.54 (1.49) | 82 (27) | 1.82 (0.22) | 99.1 (32.8) | 23.2 (1.8) | 8.9 (2.8) | 1.93 (0.37) | 27% | 2.21 (0.68) |


