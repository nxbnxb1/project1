# DART ablation summary

Sweep: speed = 4

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 0% [0, 28] | 0.65 (0.16) | 48.27 (27.80) | 1.85 (0.63) | 224 (138) | 4.36 (0.76) | 269.3 (165.1) | 25.7 (1.7) | 4.8 (0.4) | 2.57 (0.29) | 42% | 1.83 (0.35) |
| FR_SAFE_3 | 10 | 80% [49, 94] | 20% [6, 51] | 0.53 (0.31) | 60.12 (24.29) | 1.88 (0.46) | 150 (85) | 2.96 (0.02) | 181.6 (103.6) | 24.2 (1.8) | 4.4 (0.5) | 2.29 (0.32) | 40% | 1.84 (0.34) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.68 (0.14) | 47.78 (28.24) | 2.00 (0.59) | 267 (158) | 5.77 (0.91) | 321.8 (188.6) | 24.2 (2.0) | 4.1 (0.6) | 2.30 (0.34) | 29% | 1.73 (0.33) |


