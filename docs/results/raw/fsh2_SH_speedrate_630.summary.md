# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 30% [11, 60] | 0.63 (0.53) | 68.35 (9.23) | 4.82 (0.53) | 112 (53) | 1.94 (0.58) | 135.9 (62.3) | 25.2 (1.0) | 8.7 (1.3) | 2.39 (0.18) | 22% | 2.01 (0.44) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.77 (0.29) | 79.23 (16.54) | 4.55 (0.62) | 233 (49) | 2.95 (0.00) | 281.1 (58.8) | 25.4 (1.0) | 9.0 (0.6) | 2.43 (0.20) | 28% | 2.32 (0.50) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.72 (0.37) | 73.56 (12.49) | 4.82 (0.53) | 144 (32) | 1.98 (0.12) | 173.1 (40.2) | 25.3 (0.7) | 9.0 (0.4) | 2.40 (0.15) | 22% | 2.31 (0.65) |


