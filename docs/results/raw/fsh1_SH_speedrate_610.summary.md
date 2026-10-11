# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 20% [6, 51] | 0.61 (0.42) | 117.99 (41.64) | 3.29 (0.85) | 100 (54) | 0.88 (0.08) | 119.0 (64.7) | 25.0 (1.7) | 9.1 (0.6) | 2.44 (0.28) | 38% | 2.17 (0.62) |
| FR_SAFE | 10 | 70% [40, 89] | 20% [6, 51] | 0.86 (0.53) | 106.94 (20.43) | 3.42 (0.95) | 111 (60) | 1.01 (0.02) | 132.6 (71.3) | 25.4 (1.3) | 9.4 (0.5) | 2.50 (0.22) | 38% | 2.14 (0.57) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.35) | 115.94 (38.72) | 3.53 (0.85) | 115 (37) | 1.00 (0.00) | 137.5 (45.3) | 25.2 (1.4) | 9.6 (0.7) | 2.45 (0.25) | 37% | 2.06 (0.34) |


