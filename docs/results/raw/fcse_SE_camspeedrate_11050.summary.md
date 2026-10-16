# DART ablation summary

Sweep: camspeedrate = 11050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.70 (1.51) | 38.57 (24.95) | 7.00 (2.50) | 107 (120) | 2.05 (1.30) | 131.2 (147.7) | 22.1 (2.9) | 4.1 (3.2) | 1.74 (0.67) | 23% | 4.01 (2.61) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.62 (1.59) | 31.98 (18.71) | 7.34 (2.19) | 169 (95) | 5.01 (0.01) | 206.6 (117.3) | 22.1 (2.9) | 4.5 (3.0) | 1.76 (0.66) | 25% | 4.14 (2.52) |


