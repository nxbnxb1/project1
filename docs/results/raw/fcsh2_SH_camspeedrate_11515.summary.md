# DART ablation summary

Sweep: camspeedrate = 11515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 20% [7, 45] | 60% [36, 80] | 0.37 (0.53) | 107.59 (10.66) | 3.74 (1.93) | 112 (58) | 1.33 (0.11) | 137.2 (70.9) | 22.4 (2.2) | 5.8 (1.3) | 2.01 (0.37) | 41% | 1.80 (0.66) |
| FR_SAFE | 15 | 40% [20, 64] | 53% [30, 75] | 0.32 (0.53) | 112.89 (21.90) | 4.14 (1.47) | 116 (75) | 1.51 (0.02) | 142.5 (92.5) | 23.7 (2.7) | 6.4 (0.7) | 2.23 (0.41) | 45% | 1.93 (0.51) |


