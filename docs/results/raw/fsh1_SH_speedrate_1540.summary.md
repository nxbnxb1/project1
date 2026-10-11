# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.96 (0.24) | 57.87 (13.15) | 6.09 (1.09) | 149 (58) | 2.56 (0.76) | 178.4 (71.4) | 26.7 (0.3) | 9.0 (0.8) | 2.72 (0.07) | 45% | 2.15 (0.72) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.78 (0.38) | 62.31 (23.16) | 6.08 (1.40) | 250 (93) | 4.01 (0.01) | 298.5 (109.7) | 26.2 (1.1) | 8.9 (0.5) | 2.64 (0.18) | 48% | 2.24 (0.36) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.63 (0.40) | 63.41 (15.55) | 5.73 (1.17) | 165 (53) | 2.85 (0.18) | 198.9 (64.7) | 26.3 (1.0) | 8.8 (0.6) | 2.66 (0.18) | 52% | 2.20 (0.54) |


