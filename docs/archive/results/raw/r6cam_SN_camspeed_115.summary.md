# DART ablation summary

Sweep: camspeed = 115

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 20% [7, 45] | 1.45 (1.23) | 37.97 (7.84) | 7.26 (3.23) | 57 (22) | 1.39 (0.54) | 69.3 (25.2) | 20.7 (3.0) | 3.0 (0.8) | 1.54 (0.38) | 22% | 2.71 (1.02) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 20% [7, 45] | 1.62 (1.32) | 46.46 (22.37) | 8.25 (1.85) | 121 (69) | 2.96 (0.02) | 147.2 (83.5) | 22.5 (1.1) | 3.5 (0.9) | 1.81 (0.19) | 30% | 2.91 (0.80) |


