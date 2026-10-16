# DART ablation summary

Sweep: camspeedrate = 11510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 20% [7, 45] | 73% [48, 89] | 0.15 (0.44) | 115.65 (36.42) | 4.84 (2.66) | 60 (44) | 0.94 (0.08) | 73.3 (53.0) | 23.6 (2.3) | 5.7 (1.7) | 2.17 (0.43) | 46% | 2.23 (0.58) |
| FR_SAFE | 15 | 13% [4, 38] | 80% [55, 93] | 0.11 (0.27) | 86.20 (59.69) | 5.58 (3.03) | 55 (51) | 1.02 (0.03) | 67.0 (62.2) | 23.7 (2.4) | 5.5 (1.7) | 2.18 (0.38) | 44% | 1.95 (0.48) |


