# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.78 (0.29) | 71.93 (22.67) | 5.28 (1.10) | 214 (93) | 2.94 (0.73) | 259.1 (114.8) | 26.2 (1.1) | 16.1 (1.7) | 2.63 (0.20) | 47% | 1.97 (0.40) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.69 (0.33) | 56.44 (9.95) | 6.04 (0.60) | 246 (43) | 4.36 (0.00) | 295.8 (52.5) | 26.9 (0.6) | 17.4 (0.8) | 2.76 (0.11) | 48% | 2.21 (0.49) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.81 (0.43) | 59.74 (12.64) | 5.83 (0.75) | 180 (39) | 3.01 (0.16) | 216.2 (46.2) | 26.5 (0.4) | 16.6 (0.6) | 2.68 (0.08) | 47% | 2.14 (0.40) |


