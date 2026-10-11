# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 20% [6, 51] | 70% [40, 89] | 0.08 (0.19) | 108.46 (4.06) | 3.97 (1.65) | 38 (29) | 0.49 (0.03) | 45.3 (34.6) | 25.1 (2.0) | 8.5 (1.4) | 2.44 (0.38) | 51% | 2.11 (0.55) |
| FR_SAFE | 10 | 20% [6, 51] | 70% [40, 89] | 0.32 (0.63) | 129.35 (84.54) | 4.67 (1.77) | 27 (29) | 0.55 (0.07) | 32.4 (36.2) | 24.7 (2.9) | 8.0 (2.2) | 2.34 (0.58) | 35% | 1.87 (0.52) |
| E_DART | 10 | 40% [17, 69] | 30% [11, 60] | 0.75 (0.85) | 140.95 (44.81) | 3.45 (1.97) | 44 (31) | 0.54 (0.06) | 54.1 (37.4) | 25.2 (3.7) | 8.9 (2.8) | 2.47 (0.71) | 54% | 1.94 (0.65) |


