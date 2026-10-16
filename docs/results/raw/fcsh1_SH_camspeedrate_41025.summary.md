# DART ablation summary

Sweep: camspeedrate = 41025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.75 (0.51) | 71.74 (14.74) | 5.21 (0.86) | 134 (38) | 1.82 (0.19) | 646.1 (186.2) | 26.6 (0.5) | 16.7 (1.6) | 2.71 (0.11) | 49% | 2.00 (0.33) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.74 (0.47) | 70.99 (13.12) | 5.23 (0.90) | 173 (37) | 2.43 (0.02) | 833.3 (178.6) | 26.2 (1.1) | 16.4 (1.8) | 2.63 (0.22) | 48% | 2.07 (0.35) |


