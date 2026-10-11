# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.12 (2.34) | 28.93 (16.56) | 8.37 (2.37) | 63 (57) | 1.93 (0.62) | 75.8 (67.7) | 23.5 (2.0) | 8.8 (5.7) | 2.07 (0.44) | 30% | 3.29 (2.55) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.78 (1.88) | 28.44 (13.26) | 8.32 (2.24) | 99 (46) | 3.47 (0.01) | 118.2 (54.9) | 23.5 (1.8) | 9.1 (5.6) | 2.06 (0.41) | 30% | 3.48 (2.49) |
| E_DART | 30 | 93% [79, 98] | 7% [2, 21] | 2.69 (1.89) | 27.50 (13.04) | 8.29 (2.22) | 65 (42) | 2.31 (0.25) | 77.8 (49.6) | 23.5 (2.0) | 8.7 (5.5) | 2.06 (0.43) | 29% | 3.80 (2.65) |


