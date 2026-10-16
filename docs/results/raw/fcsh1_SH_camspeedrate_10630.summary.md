# DART ablation summary

Sweep: camspeedrate = 10630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 20% [7, 45] | 0.41 (0.35) | 117.50 (36.62) | 3.57 (0.95) | 214 (125) | 1.88 (0.52) | 261.6 (153.6) | 22.8 (1.3) | 12.1 (2.3) | 2.05 (0.21) | 36% | 2.15 (0.66) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.57 (0.38) | 123.65 (27.61) | 3.80 (0.82) | 307 (139) | 2.95 (0.01) | 375.6 (171.6) | 24.3 (0.8) | 14.8 (1.0) | 2.30 (0.13) | 37% | 2.26 (0.37) |


