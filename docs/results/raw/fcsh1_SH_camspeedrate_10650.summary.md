# DART ablation summary

Sweep: camspeedrate = 10650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.46 (0.40) | 110.54 (38.52) | 3.99 (0.67) | 289 (198) | 2.70 (0.73) | 354.6 (244.7) | 23.9 (0.8) | 12.7 (1.2) | 2.20 (0.14) | 34% | 2.16 (0.44) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.56 (0.49) | 115.72 (35.16) | 3.68 (0.74) | 561 (170) | 5.00 (0.00) | 686.0 (209.8) | 24.6 (1.2) | 15.3 (1.3) | 2.35 (0.21) | 41% | 2.49 (0.46) |


