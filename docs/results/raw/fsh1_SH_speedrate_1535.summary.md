# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.91 (0.40) | 67.10 (7.83) | 5.48 (0.59) | 154 (48) | 2.36 (0.63) | 185.6 (58.2) | 26.9 (0.6) | 16.9 (1.0) | 2.75 (0.12) | 52% | 2.10 (0.47) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.86 (0.23) | 60.08 (14.28) | 5.86 (1.03) | 208 (49) | 3.46 (0.01) | 249.6 (59.7) | 26.9 (0.4) | 17.3 (0.6) | 2.75 (0.08) | 50% | 2.21 (0.24) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.52 (0.42) | 59.35 (11.87) | 6.14 (0.93) | 133 (52) | 2.55 (0.11) | 159.8 (63.3) | 26.2 (0.8) | 15.9 (1.0) | 2.62 (0.16) | 47% | 2.03 (0.35) |


