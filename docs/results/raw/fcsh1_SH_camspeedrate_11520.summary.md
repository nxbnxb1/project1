# DART ablation summary

Sweep: camspeedrate = 11520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 20% [7, 45] | 60% [36, 80] | 0.16 (0.36) | 143.73 (45.83) | 3.60 (1.29) | 147 (112) | 1.74 (0.14) | 180.0 (137.3) | 24.4 (2.0) | 13.0 (2.5) | 2.36 (0.34) | 53% | 2.33 (0.66) |
| FR_SAFE | 15 | 53% [30, 75] | 47% [25, 70] | 0.45 (0.54) | 99.67 (31.36) | 4.77 (1.55) | 129 (94) | 2.02 (0.04) | 156.9 (114.2) | 24.5 (1.8) | 12.6 (2.6) | 2.34 (0.33) | 45% | 2.27 (0.50) |


