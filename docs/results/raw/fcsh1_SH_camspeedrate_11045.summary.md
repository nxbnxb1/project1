# DART ablation summary

Sweep: camspeedrate = 11045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.51 (0.44) | 94.89 (35.41) | 4.55 (1.16) | 256 (172) | 2.95 (0.47) | 312.6 (209.8) | 24.0 (2.2) | 12.9 (1.6) | 2.26 (0.35) | 46% | 2.61 (0.70) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.46 (0.44) | 85.83 (16.70) | 4.68 (0.81) | 334 (136) | 4.36 (0.02) | 408.0 (165.2) | 25.4 (0.9) | 15.8 (1.0) | 2.51 (0.14) | 49% | 2.35 (0.63) |


