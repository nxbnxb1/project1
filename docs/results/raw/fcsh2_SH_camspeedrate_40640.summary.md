# DART ablation summary

Sweep: camspeedrate = 40640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.69 (0.47) | 88.31 (23.84) | 4.52 (0.75) | 141 (82) | 2.00 (0.53) | 679.6 (399.7) | 24.9 (1.5) | 8.7 (1.4) | 2.34 (0.27) | 26% | 2.14 (0.56) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.77 (0.46) | 75.60 (15.19) | 4.94 (0.58) | 186 (80) | 2.89 (0.06) | 892.2 (379.2) | 24.9 (1.4) | 9.1 (1.2) | 2.34 (0.27) | 21% | 2.20 (0.62) |


