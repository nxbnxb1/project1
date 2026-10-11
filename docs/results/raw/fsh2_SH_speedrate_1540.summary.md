# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.88 (0.37) | 59.42 (14.64) | 5.96 (1.11) | 157 (61) | 2.64 (0.76) | 188.6 (73.2) | 26.5 (0.5) | 16.3 (1.2) | 2.67 (0.09) | 45% | 1.98 (0.51) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.81 (0.46) | 58.37 (14.39) | 5.99 (1.01) | 219 (72) | 4.01 (0.01) | 263.3 (85.6) | 26.5 (0.8) | 17.0 (0.6) | 2.68 (0.16) | 50% | 2.00 (0.36) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.67 (0.39) | 56.81 (11.93) | 5.90 (1.04) | 148 (50) | 2.84 (0.13) | 178.3 (59.4) | 26.5 (0.8) | 16.6 (0.9) | 2.68 (0.15) | 45% | 2.02 (0.32) |


