# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 10% [2, 40] | 0.77 (0.45) | 106.94 (37.91) | 3.77 (1.13) | 91 (51) | 0.86 (0.11) | 109.1 (61.0) | 24.8 (1.6) | 14.5 (2.6) | 2.38 (0.31) | 33% | 2.09 (0.51) |
| FR_SAFE | 10 | 60% [31, 83] | 20% [6, 51] | 0.77 (0.55) | 115.28 (31.73) | 3.34 (1.31) | 99 (41) | 1.01 (0.01) | 118.3 (50.6) | 25.5 (2.1) | 15.6 (3.3) | 2.51 (0.41) | 42% | 2.33 (0.59) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.77 (0.43) | 94.92 (35.18) | 3.85 (0.92) | 105 (44) | 1.01 (0.00) | 123.7 (52.6) | 25.1 (1.2) | 14.9 (1.5) | 2.44 (0.22) | 35% | 2.00 (0.34) |


