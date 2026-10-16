# DART ablation summary

Sweep: camspeedrate = 40620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.77 (0.48) | 88.59 (20.03) | 4.20 (0.66) | 128 (53) | 1.46 (0.30) | 615.9 (257.2) | 25.3 (1.8) | 15.2 (2.2) | 2.43 (0.32) | 30% | 1.92 (0.44) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.63 (0.52) | 90.53 (26.39) | 4.54 (0.73) | 134 (80) | 2.01 (0.02) | 643.5 (384.3) | 24.8 (1.9) | 15.8 (2.5) | 2.34 (0.36) | 29% | 2.17 (0.70) |


