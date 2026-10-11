# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.33 (1.02) | 37.04 (5.80) | 5.56 (0.31) | 83 (56) | 2.19 (1.30) | 99.7 (67.3) | 19.1 (4.6) | 5.9 (3.7) | 1.38 (0.81) | 4% | 3.87 (2.87) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.00 (1.04) | 36.82 (2.39) | 5.51 (0.27) | 184 (12) | 5.01 (0.01) | 221.5 (14.3) | 19.2 (4.8) | 6.3 (3.9) | 1.40 (0.84) | 6% | 3.71 (2.59) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.05 (0.98) | 39.18 (15.09) | 5.44 (0.64) | 86 (83) | 2.01 (0.84) | 102.6 (100.8) | 19.4 (4.9) | 6.2 (4.1) | 1.43 (0.87) | 7% | 3.74 (2.88) |


