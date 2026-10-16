# DART ablation summary

Sweep: camspeedrate = 41535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.35 (0.63) | 41.53 (12.38) | 8.27 (1.67) | 78 (35) | 1.88 (0.31) | 375.4 (171.4) | 24.9 (1.2) | 10.0 (3.3) | 2.29 (0.26) | 35% | 2.38 (0.57) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.64 (1.58) | 39.09 (7.57) | 8.62 (1.38) | 110 (21) | 2.86 (0.05) | 528.2 (105.1) | 24.7 (1.0) | 10.0 (3.0) | 2.26 (0.22) | 33% | 2.56 (0.98) |


