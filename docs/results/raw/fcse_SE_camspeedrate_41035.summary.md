# DART ablation summary

Sweep: camspeedrate = 41035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.32 (1.86) | 31.73 (13.96) | 7.32 (1.99) | 51 (46) | 1.36 (0.68) | 244.7 (221.5) | 22.4 (3.0) | 8.3 (5.8) | 1.81 (0.69) | 26% | 3.44 (2.71) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.36 (2.21) | 30.76 (10.88) | 7.54 (1.64) | 87 (31) | 2.85 (0.05) | 420.5 (149.3) | 22.2 (2.9) | 8.3 (5.5) | 1.77 (0.65) | 23% | 3.73 (2.75) |


