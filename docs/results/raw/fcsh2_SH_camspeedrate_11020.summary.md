# DART ablation summary

Sweep: camspeedrate = 11020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 20% [7, 45] | 0.48 (0.39) | 101.86 (40.67) | 4.19 (1.23) | 155 (95) | 1.55 (0.26) | 190.7 (115.7) | 24.1 (1.7) | 11.7 (1.4) | 2.28 (0.26) | 43% | 2.01 (0.39) |
| FR_SAFE | 15 | 53% [30, 75] | 40% [20, 64] | 0.59 (0.66) | 129.00 (38.18) | 3.46 (1.55) | 209 (91) | 2.01 (0.01) | 256.2 (110.7) | 23.3 (2.7) | 12.1 (2.1) | 2.19 (0.42) | 45% | 2.15 (0.51) |


