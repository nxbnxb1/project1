# DART ablation summary

Sweep: camspeedrate = 41515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.71 (2.48) | 31.66 (17.24) | 8.09 (2.63) | 35 (25) | 1.01 (0.17) | 165.4 (120.3) | 23.2 (2.1) | 8.0 (5.6) | 2.00 (0.46) | 29% | 3.44 (2.55) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 3.60 (2.65) | 35.12 (27.45) | 7.95 (2.87) | 52 (40) | 1.51 (0.01) | 252.4 (192.9) | 23.2 (2.3) | 8.7 (6.2) | 2.00 (0.49) | 29% | 3.81 (2.44) |


