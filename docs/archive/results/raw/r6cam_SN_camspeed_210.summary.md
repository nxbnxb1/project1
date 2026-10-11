# DART ablation summary

Sweep: camspeed = 210

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 20% [7, 45] | 1.05 (1.22) | 58.58 (24.98) | 6.27 (2.45) | 82 (42) | 1.40 (0.45) | 98.8 (49.7) | 20.3 (2.2) | 4.2 (1.3) | 1.46 (0.33) | 25% | 2.69 (0.76) |
| FR_SAFE_3 | 15 | 53% [30, 75] | 40% [20, 64] | 0.73 (0.81) | 46.46 (13.53) | 6.89 (2.19) | 124 (54) | 2.96 (0.01) | 149.5 (65.5) | 20.8 (2.1) | 4.3 (1.4) | 1.53 (0.36) | 25% | 3.27 (0.98) |


