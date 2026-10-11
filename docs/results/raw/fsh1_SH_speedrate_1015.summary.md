# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.71 (0.38) | 81.67 (10.60) | 4.65 (0.49) | 97 (12) | 1.23 (0.13) | 116.8 (16.7) | 26.2 (1.0) | 16.2 (0.9) | 2.64 (0.17) | 44% | 2.06 (0.28) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.84 (0.35) | 83.87 (41.00) | 4.57 (1.37) | 128 (58) | 1.50 (0.00) | 152.7 (68.9) | 26.6 (1.1) | 16.8 (1.1) | 2.72 (0.19) | 52% | 2.28 (0.46) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.71 (0.50) | 81.43 (33.75) | 4.73 (1.19) | 112 (44) | 1.36 (0.02) | 135.5 (53.1) | 27.0 (0.6) | 17.0 (1.0) | 2.79 (0.13) | 55% | 2.16 (0.50) |


