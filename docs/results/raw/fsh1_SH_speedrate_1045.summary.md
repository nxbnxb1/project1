# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.82 (0.40) | 54.00 (9.18) | 5.97 (1.30) | 154 (61) | 2.79 (0.94) | 185.0 (73.7) | 26.8 (1.0) | 16.4 (2.1) | 2.73 (0.22) | 45% | 2.19 (0.60) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.78 (0.37) | 55.54 (7.48) | 6.10 (0.71) | 238 (33) | 4.36 (0.01) | 286.3 (40.3) | 26.7 (0.6) | 16.8 (1.0) | 2.69 (0.12) | 44% | 2.25 (0.29) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.73 (0.38) | 60.00 (11.22) | 5.52 (1.00) | 180 (40) | 3.01 (0.30) | 215.9 (49.4) | 26.5 (1.0) | 16.2 (1.2) | 2.68 (0.21) | 47% | 1.82 (0.29) |


