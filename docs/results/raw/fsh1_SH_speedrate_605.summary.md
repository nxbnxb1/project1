# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 20% [6, 51] | 0.71 (0.59) | 127.83 (35.93) | 3.18 (1.10) | 51 (22) | 0.48 (0.04) | 61.7 (27.2) | 24.7 (2.5) | 14.2 (2.0) | 2.38 (0.49) | 44% | 1.83 (0.39) |
| FR_SAFE | 10 | 40% [17, 69] | 50% [24, 76] | 0.59 (0.80) | 154.35 (44.79) | 2.83 (0.93) | 54 (31) | 0.51 (0.02) | 65.0 (35.8) | 26.1 (1.6) | 15.3 (2.7) | 2.63 (0.31) | 45% | 1.94 (0.52) |
| E_DART | 10 | 30% [11, 60] | 40% [17, 69] | 0.56 (0.53) | 153.09 (93.01) | 3.30 (1.54) | 61 (44) | 0.52 (0.03) | 73.8 (54.9) | 23.9 (2.9) | 13.1 (3.1) | 2.23 (0.55) | 39% | 1.80 (0.32) |


