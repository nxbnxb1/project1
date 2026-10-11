# DART ablation summary

Sweep: camspeed = 210

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 33% [15, 58] | 0.59 (0.65) | 102.69 (28.22) | 4.11 (1.36) | 131 (68) | 1.65 (0.55) | 155.7 (80.5) | 20.4 (2.6) | 3.2 (0.6) | 1.66 (0.40) | 43% | 2.82 (1.18) |
| FR_SAFE_3 | 15 | 73% [48, 89] | 20% [7, 45] | 0.80 (0.67) | 102.73 (31.87) | 4.44 (1.39) | 279 (90) | 2.95 (0.00) | 333.1 (108.1) | 22.4 (1.4) | 3.8 (0.4) | 1.99 (0.21) | 46% | 2.43 (0.43) |


