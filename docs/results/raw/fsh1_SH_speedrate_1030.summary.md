# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.63 (0.35) | 83.80 (26.91) | 4.96 (1.40) | 170 (82) | 2.18 (0.34) | 204.2 (98.8) | 25.5 (1.4) | 16.5 (1.4) | 2.52 (0.23) | 42% | 2.01 (0.43) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.65 (0.33) | 59.46 (7.65) | 5.78 (0.61) | 175 (22) | 2.95 (0.01) | 211.2 (29.2) | 26.6 (0.4) | 16.9 (0.8) | 2.70 (0.09) | 46% | 2.27 (0.31) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.68 (0.50) | 73.17 (21.27) | 5.10 (0.84) | 132 (62) | 2.22 (0.19) | 158.8 (73.9) | 25.9 (2.2) | 16.3 (1.7) | 2.58 (0.36) | 47% | 2.65 (0.63) |


