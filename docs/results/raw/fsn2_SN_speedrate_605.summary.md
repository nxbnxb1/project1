# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 0.99 (0.69) | 78.97 (36.31) | 4.81 (1.01) | 32 (19) | 0.41 (0.05) | 37.9 (21.7) | 18.8 (3.1) | 6.4 (3.2) | 1.31 (0.55) | 17% | 1.96 (0.69) |
| FR_SAFE | 20 | 80% [58, 92] | 10% [3, 30] | 1.14 (0.66) | 85.28 (47.69) | 4.45 (1.43) | 42 (23) | 0.51 (0.01) | 49.4 (26.9) | 19.4 (3.4) | 7.3 (4.3) | 1.41 (0.63) | 19% | 2.13 (0.67) |
| E_DART | 20 | 85% [64, 95] | 15% [5, 36] | 1.11 (0.78) | 73.46 (29.57) | 4.72 (1.22) | 38 (18) | 0.51 (0.01) | 45.0 (21.1) | 19.1 (3.1) | 6.4 (3.5) | 1.37 (0.57) | 18% | 2.13 (0.64) |


