# DART ablation summary

Sweep: camspeed = 106

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 20% [7, 45] | 0.93 (0.72) | 193.62 (10.51) | 2.51 (1.13) | 153 (85) | 1.09 (0.34) | 187.8 (105.0) | 18.4 (2.2) | 5.5 (0.9) | 1.37 (0.35) | 31% | 2.43 (0.50) |
| FR_SAFE_3 | 15 | 73% [48, 89] | 0% [0, 20] | 1.54 (0.82) | 169.90 (42.61) | 2.74 (0.86) | 460 (152) | 2.95 (0.00) | 561.1 (186.1) | 22.2 (2.6) | 7.5 (1.3) | 1.99 (0.42) | 45% | 2.77 (0.72) |


