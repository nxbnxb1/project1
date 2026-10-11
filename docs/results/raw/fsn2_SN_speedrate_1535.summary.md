# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.33 (0.51) | 37.69 (9.87) | 8.93 (1.52) | 82 (29) | 2.14 (0.30) | 97.6 (33.2) | 24.5 (0.7) | 7.0 (2.4) | 2.20 (0.16) | 29% | 2.43 (0.74) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.26 (0.38) | 38.09 (9.95) | 8.74 (1.58) | 132 (34) | 3.46 (0.01) | 156.7 (40.1) | 24.7 (1.1) | 7.4 (2.7) | 2.26 (0.24) | 33% | 2.44 (0.55) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 0.95 (0.53) | 36.15 (5.75) | 8.95 (1.28) | 86 (14) | 2.41 (0.13) | 102.2 (15.5) | 24.6 (0.9) | 6.8 (2.3) | 2.23 (0.20) | 30% | 2.16 (0.61) |


