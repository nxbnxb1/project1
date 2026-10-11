# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.94 (0.33) | 55.51 (11.10) | 6.21 (1.04) | 154 (53) | 2.80 (0.86) | 186.2 (65.3) | 26.1 (1.5) | 15.3 (1.8) | 2.62 (0.26) | 47% | 2.18 (0.54) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.84 (0.36) | 54.53 (8.81) | 6.29 (0.78) | 237 (38) | 4.35 (0.01) | 286.0 (48.2) | 26.3 (0.7) | 16.1 (0.5) | 2.64 (0.12) | 46% | 2.02 (0.43) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.83 (0.42) | 55.87 (15.74) | 6.17 (1.07) | 166 (71) | 3.13 (0.25) | 200.2 (85.9) | 26.8 (0.7) | 15.9 (0.8) | 2.73 (0.14) | 50% | 2.05 (0.29) |


