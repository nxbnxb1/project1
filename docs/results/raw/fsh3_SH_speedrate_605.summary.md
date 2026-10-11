# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 50% [24, 76] | 40% [17, 69] | 0.66 (0.76) | 153.35 (56.80) | 3.12 (1.09) | 52 (31) | 0.47 (0.03) | 61.7 (39.3) | 24.7 (1.6) | 10.1 (2.0) | 2.38 (0.31) | 43% | 1.85 (0.52) |
| FR_SAFE | 10 | 30% [11, 60] | 70% [40, 89] | 0.17 (0.31) | 120.56 (40.73) | 3.52 (1.31) | 50 (39) | 0.52 (0.03) | 58.9 (46.6) | 24.9 (2.1) | 10.2 (2.4) | 2.39 (0.41) | 39% | 2.32 (0.94) |
| E_DART | 10 | 50% [24, 76] | 50% [24, 76] | 0.30 (0.37) | 206.46 (64.77) | 3.27 (1.29) | 63 (52) | 0.53 (0.06) | 73.7 (61.0) | 24.3 (3.7) | 10.0 (3.2) | 2.32 (0.69) | 45% | 2.20 (0.72) |


