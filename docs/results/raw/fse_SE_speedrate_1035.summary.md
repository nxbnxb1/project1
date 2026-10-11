# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.70 (1.61) | 28.51 (7.91) | 7.71 (1.43) | 53 (34) | 1.73 (0.74) | 63.8 (39.9) | 22.2 (2.7) | 8.6 (5.3) | 1.77 (0.63) | 23% | 3.49 (2.48) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.49 (1.17) | 30.16 (14.51) | 7.57 (1.64) | 105 (50) | 3.47 (0.01) | 125.2 (60.6) | 22.5 (3.0) | 9.0 (5.7) | 1.84 (0.68) | 27% | 3.42 (2.42) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.22 (1.04) | 30.68 (11.33) | 7.34 (1.75) | 65 (43) | 1.93 (0.59) | 77.4 (50.5) | 22.4 (3.0) | 8.6 (5.8) | 1.81 (0.68) | 25% | 3.41 (2.63) |


