# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.79 (0.44) | 67.96 (16.83) | 5.40 (1.08) | 153 (64) | 2.43 (0.58) | 182.2 (76.2) | 26.1 (1.4) | 15.9 (1.4) | 2.63 (0.24) | 46% | 2.12 (0.53) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.78 (0.45) | 59.68 (16.02) | 6.12 (0.91) | 189 (74) | 3.46 (0.01) | 226.2 (89.0) | 26.6 (0.8) | 16.7 (2.0) | 2.69 (0.16) | 45% | 2.08 (0.41) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.60 (0.43) | 66.60 (19.71) | 5.67 (1.04) | 166 (52) | 2.60 (0.19) | 198.7 (62.6) | 26.5 (0.9) | 16.4 (1.1) | 2.68 (0.17) | 50% | 2.35 (0.43) |


