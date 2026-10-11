# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 1.05 (0.20) | 93.16 (17.06) | 4.05 (0.53) | 108 (23) | 1.17 (0.19) | 129.6 (28.0) | 25.2 (1.3) | 8.1 (0.7) | 2.42 (0.25) | 30% | 2.27 (0.53) |
| FR_SAFE | 10 | 90% [60, 98] | 0% [0, 28] | 0.82 (0.36) | 110.80 (28.86) | 3.32 (0.84) | 163 (42) | 1.50 (0.00) | 195.6 (52.8) | 25.2 (2.7) | 9.0 (1.1) | 2.45 (0.45) | 38% | 2.51 (0.42) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.79 (0.30) | 88.55 (25.10) | 4.30 (0.77) | 116 (35) | 1.30 (0.04) | 139.6 (45.1) | 25.4 (0.7) | 8.2 (0.8) | 2.44 (0.16) | 30% | 2.18 (0.42) |


