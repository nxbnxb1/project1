# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.69 (0.33) | 91.28 (18.41) | 4.05 (0.69) | 136 (49) | 1.46 (0.31) | 163.2 (59.0) | 24.3 (0.9) | 14.8 (0.7) | 2.26 (0.13) | 24% | 2.11 (0.40) |
| FR_SAFE | 10 | 70% [40, 89] | 20% [6, 51] | 0.72 (0.45) | 91.55 (22.17) | 3.76 (1.18) | 155 (62) | 2.01 (0.00) | 186.8 (74.3) | 25.5 (1.7) | 16.4 (2.0) | 2.48 (0.33) | 37% | 2.42 (0.65) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.66 (0.41) | 86.70 (21.96) | 4.22 (0.68) | 128 (53) | 1.58 (0.05) | 153.3 (64.3) | 25.0 (1.7) | 15.3 (1.9) | 2.38 (0.30) | 32% | 2.38 (0.35) |


