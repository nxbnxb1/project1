# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.32 (1.08) | 41.53 (13.34) | 5.22 (0.80) | 65 (52) | 1.43 (0.78) | 77.2 (62.8) | 19.4 (4.9) | 6.0 (4.1) | 1.44 (0.88) | 10% | 3.68 (2.60) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.21 (1.06) | 38.59 (6.51) | 5.38 (0.54) | 114 (19) | 2.95 (0.01) | 136.5 (23.0) | 19.5 (4.9) | 6.2 (4.0) | 1.46 (0.87) | 9% | 4.08 (2.75) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.39 (1.01) | 38.66 (6.39) | 5.40 (0.53) | 62 (26) | 1.58 (0.44) | 75.0 (30.9) | 19.3 (4.8) | 5.8 (3.9) | 1.41 (0.85) | 8% | 3.73 (2.68) |


