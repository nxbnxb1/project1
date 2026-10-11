# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.81 (1.52) | 31.80 (15.48) | 7.39 (1.89) | 58 (52) | 1.58 (0.69) | 68.8 (62.8) | 22.3 (2.9) | 8.7 (5.7) | 1.80 (0.68) | 24% | 3.62 (2.39) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.46 (1.38) | 31.28 (12.59) | 7.36 (1.78) | 93 (37) | 2.96 (0.01) | 110.4 (42.9) | 22.6 (3.0) | 9.1 (5.8) | 1.85 (0.69) | 28% | 3.59 (2.39) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.42 (1.39) | 32.30 (14.99) | 7.25 (1.85) | 63 (46) | 1.78 (0.48) | 75.0 (53.8) | 22.4 (3.0) | 8.8 (5.8) | 1.82 (0.69) | 26% | 3.38 (2.36) |


