# DART ablation summary

Sweep: camspeedrate = 41505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 20% [7, 45] | 73% [48, 89] | 0.22 (0.51) | 96.19 (26.06) | 4.09 (2.12) | 27 (19) | 0.50 (0.05) | 127.4 (93.7) | 24.8 (3.1) | 14.1 (3.2) | 2.41 (0.51) | 49% | 1.95 (0.66) |
| FR_SAFE | 15 | 20% [7, 45] | 73% [48, 89] | 0.11 (0.41) | 107.08 (42.69) | 4.20 (1.69) | 29 (23) | 0.52 (0.03) | 136.2 (110.8) | 24.8 (2.3) | 14.2 (2.9) | 2.38 (0.42) | 42% | 2.33 (0.75) |


