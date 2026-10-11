# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 70% [48, 85] | 25% [11, 47] | 0.81 (0.65) | 65.11 (42.95) | 6.19 (1.72) | 27 (21) | 0.48 (0.02) | 32.8 (26.4) | 22.5 (1.5) | 8.4 (2.7) | 1.84 (0.35) | 28% | 2.23 (0.93) |
| FR_SAFE | 20 | 70% [48, 85] | 30% [15, 52] | 0.97 (1.63) | 58.86 (18.39) | 5.74 (2.11) | 28 (12) | 0.51 (0.02) | 33.7 (13.4) | 23.5 (2.3) | 9.9 (4.6) | 2.01 (0.52) | 32% | 2.21 (0.67) |
| E_DART | 20 | 70% [48, 85] | 30% [15, 52] | 0.75 (1.18) | 64.56 (20.65) | 5.72 (1.64) | 29 (13) | 0.51 (0.02) | 35.3 (15.1) | 23.5 (1.9) | 9.1 (3.2) | 2.03 (0.43) | 35% | 2.19 (0.78) |


