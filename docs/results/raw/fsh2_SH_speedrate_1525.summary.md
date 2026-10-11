# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.82 (0.52) | 58.97 (8.23) | 5.71 (0.74) | 100 (30) | 1.82 (0.36) | 120.2 (35.4) | 26.4 (0.7) | 11.6 (0.7) | 2.66 (0.14) | 46% | 2.18 (0.41) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.78 (0.30) | 71.38 (18.31) | 5.11 (1.04) | 179 (46) | 2.51 (0.01) | 214.3 (53.9) | 26.8 (1.1) | 12.2 (0.9) | 2.76 (0.20) | 56% | 2.30 (0.96) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.96 (0.37) | 70.50 (21.47) | 5.23 (1.00) | 133 (64) | 2.07 (0.16) | 160.0 (75.1) | 27.1 (0.8) | 12.2 (0.9) | 2.81 (0.15) | 57% | 2.08 (0.27) |


