# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.41) | 70.83 (29.76) | 5.26 (1.42) | 105 (57) | 1.56 (0.28) | 125.7 (68.5) | 26.1 (1.0) | 15.4 (1.1) | 2.63 (0.17) | 49% | 1.95 (0.58) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.95 (0.26) | 64.55 (12.42) | 5.53 (0.58) | 130 (25) | 2.01 (0.01) | 155.9 (29.8) | 26.5 (0.9) | 16.3 (1.1) | 2.68 (0.17) | 52% | 2.25 (0.61) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.81 (0.41) | 74.05 (25.11) | 5.00 (1.15) | 127 (38) | 1.67 (0.07) | 152.0 (45.0) | 26.7 (0.8) | 16.3 (1.0) | 2.73 (0.15) | 54% | 1.83 (0.26) |


