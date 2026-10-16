# DART ablation summary

Sweep: camspeedrate = 20630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 33% [15, 58] | 0.38 (0.44) | 115.96 (29.93) | 3.34 (0.71) | 203 (141) | 1.99 (0.38) | 244.2 (168.6) | 22.6 (1.9) | 12.7 (2.0) | 2.03 (0.31) | 36% | 2.47 (0.79) |
| FR_SAFE | 15 | 73% [48, 89] | 20% [7, 45] | 0.60 (0.46) | 120.04 (43.69) | 3.55 (1.10) | 358 (152) | 2.94 (0.00) | 429.5 (180.7) | 24.0 (1.5) | 14.8 (1.2) | 2.25 (0.24) | 35% | 2.33 (0.57) |


