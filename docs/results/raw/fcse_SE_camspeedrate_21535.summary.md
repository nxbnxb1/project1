# DART ablation summary

Sweep: camspeedrate = 21535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 2.37 (2.12) | 39.26 (30.17) | 7.09 (2.38) | 80 (99) | 1.62 (0.95) | 95.5 (118.4) | 21.7 (2.7) | 5.3 (3.9) | 1.68 (0.63) | 23% | 3.48 (2.29) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.73 (2.25) | 30.90 (14.61) | 7.45 (2.03) | 114 (58) | 3.46 (0.01) | 136.2 (69.0) | 21.9 (2.9) | 5.5 (3.9) | 1.71 (0.66) | 23% | 3.87 (2.56) |


