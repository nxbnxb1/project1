# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.16 (1.15) | 42.30 (13.74) | 5.24 (0.78) | 75 (63) | 1.60 (0.93) | 89.7 (75.4) | 19.4 (5.0) | 9.2 (6.4) | 1.43 (0.88) | 10% | 3.79 (2.79) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.23 (1.04) | 38.09 (5.68) | 5.41 (0.53) | 132 (20) | 3.46 (0.01) | 158.3 (23.5) | 19.3 (4.7) | 9.3 (6.0) | 1.41 (0.83) | 7% | 3.95 (2.82) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 1.98 (1.05) | 39.34 (9.57) | 5.36 (0.59) | 69 (34) | 1.70 (0.53) | 82.5 (39.4) | 19.3 (4.8) | 9.2 (6.1) | 1.42 (0.84) | 9% | 3.57 (2.53) |


