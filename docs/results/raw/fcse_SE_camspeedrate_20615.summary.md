# DART ablation summary

Sweep: camspeedrate = 20615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 2.14 (1.51) | 49.77 (28.07) | 4.59 (1.50) | 58 (83) | 0.71 (0.42) | 68.9 (98.3) | 18.7 (4.5) | 7.2 (5.4) | 1.31 (0.82) | 15% | 3.44 (2.40) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.28 (1.93) | 55.08 (37.56) | 4.77 (1.31) | 79 (54) | 1.51 (0.01) | 94.9 (64.4) | 19.2 (4.9) | 7.7 (5.7) | 1.40 (0.87) | 15% | 3.98 (2.68) |


