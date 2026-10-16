# DART ablation summary

Sweep: camspeedrate = 41515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.55 (0.58) | 87.94 (28.04) | 4.71 (0.94) | 86 (52) | 1.24 (0.14) | 415.5 (255.0) | 25.8 (1.9) | 15.1 (2.3) | 2.57 (0.33) | 51% | 2.16 (0.64) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.66 (0.52) | 95.19 (21.25) | 4.44 (0.98) | 123 (51) | 1.51 (0.05) | 590.6 (247.9) | 26.1 (1.7) | 16.0 (2.4) | 2.63 (0.33) | 55% | 2.25 (0.60) |


