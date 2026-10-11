# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.83 (0.36) | 57.97 (8.49) | 5.97 (0.66) | 182 (62) | 3.13 (0.95) | 219.3 (73.9) | 26.6 (0.7) | 8.4 (0.5) | 2.69 (0.14) | 46% | 2.10 (0.67) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.72 (0.28) | 58.60 (8.01) | 6.06 (0.63) | 294 (40) | 5.01 (0.01) | 352.2 (47.9) | 26.4 (0.5) | 8.8 (0.4) | 2.66 (0.10) | 50% | 2.15 (0.41) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.52) | 62.11 (11.84) | 5.64 (0.87) | 186 (56) | 3.28 (0.23) | 224.0 (68.1) | 26.2 (0.7) | 8.5 (0.4) | 2.62 (0.11) | 46% | 2.03 (0.25) |


