# DART ablation summary

Sweep: camspeedrate = 40615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.75 (0.46) | 101.65 (25.61) | 4.02 (0.73) | 104 (57) | 1.19 (0.19) | 501.8 (275.6) | 25.2 (1.6) | 8.4 (1.3) | 2.42 (0.29) | 33% | 2.05 (0.58) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.63 (0.43) | 105.93 (31.04) | 3.93 (0.89) | 145 (57) | 1.50 (0.01) | 696.6 (274.5) | 25.5 (1.9) | 8.8 (1.4) | 2.49 (0.36) | 35% | 2.19 (0.64) |


