# DART ablation summary

Sweep: camspeedrate = 41020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.90 (0.54) | 68.32 (21.38) | 5.72 (1.14) | 89 (42) | 1.57 (0.24) | 433.4 (201.9) | 26.5 (0.9) | 15.4 (1.6) | 2.69 (0.18) | 47% | 1.94 (0.47) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.90 (0.45) | 76.80 (29.59) | 5.27 (1.36) | 144 (64) | 2.00 (0.01) | 692.0 (306.8) | 26.4 (1.0) | 16.3 (2.3) | 2.67 (0.20) | 50% | 2.00 (0.51) |


