# DART ablation summary

Sweep: camspeed = 115

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.68 (0.99) | 41.33 (16.89) | 8.60 (1.76) | 151 (69) | 4.64 (0.71) | 183.1 (82.3) | 23.2 (1.1) | 4.0 (1.3) | 1.93 (0.25) | 28% | 3.61 (1.89) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 20% [7, 45] | 1.62 (1.32) | 46.46 (22.37) | 8.25 (1.85) | 121 (69) | 2.96 (0.02) | 147.2 (83.5) | 22.5 (1.1) | 3.6 (0.9) | 1.81 (0.19) | 30% | 2.91 (0.80) |


