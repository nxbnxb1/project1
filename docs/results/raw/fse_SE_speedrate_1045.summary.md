# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.89 (1.38) | 28.39 (11.87) | 7.77 (1.51) | 67 (61) | 2.09 (1.01) | 79.7 (73.3) | 22.4 (2.9) | 4.6 (2.9) | 1.80 (0.67) | 24% | 3.43 (2.49) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.55 (1.38) | 26.89 (5.60) | 7.85 (1.18) | 117 (24) | 4.37 (0.01) | 140.5 (28.5) | 22.3 (2.8) | 4.6 (2.8) | 1.78 (0.64) | 25% | 3.72 (2.78) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.38 (1.17) | 28.87 (8.04) | 7.51 (1.52) | 67 (37) | 2.19 (0.73) | 80.6 (43.7) | 22.3 (2.7) | 4.5 (2.9) | 1.80 (0.63) | 25% | 3.42 (2.69) |


