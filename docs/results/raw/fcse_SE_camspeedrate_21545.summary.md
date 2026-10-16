# DART ablation summary

Sweep: camspeedrate = 21545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 2.55 (2.03) | 31.50 (15.59) | 7.37 (2.16) | 72 (75) | 1.80 (1.06) | 85.9 (89.8) | 21.6 (2.6) | 5.2 (3.7) | 1.65 (0.60) | 21% | 3.67 (2.31) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 2.41 (1.87) | 32.96 (22.06) | 7.37 (2.18) | 152 (99) | 4.36 (0.01) | 180.9 (116.7) | 22.0 (2.8) | 5.6 (4.0) | 1.73 (0.64) | 24% | 3.67 (2.43) |


