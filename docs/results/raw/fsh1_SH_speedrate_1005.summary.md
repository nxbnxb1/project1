# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 20% [6, 51] | 80% [49, 94] | 0.03 (0.14) | 108.46 (4.06) | 4.34 (1.54) | 31 (19) | 0.49 (0.03) | 37.1 (23.5) | 25.3 (2.0) | 7.2 (1.3) | 2.45 (0.39) | 50% | 2.10 (0.55) |
| FR_SAFE | 10 | 30% [11, 60] | 60% [31, 83] | 0.39 (0.62) | 128.85 (59.79) | 4.72 (1.71) | 32 (31) | 0.55 (0.07) | 37.9 (38.5) | 25.0 (2.8) | 6.8 (1.9) | 2.39 (0.58) | 36% | 1.80 (0.45) |
| E_DART | 10 | 30% [11, 60] | 40% [17, 69] | 0.70 (0.88) | 141.57 (54.85) | 3.33 (2.04) | 40 (30) | 0.54 (0.06) | 48.5 (36.5) | 24.9 (3.7) | 7.5 (2.3) | 2.42 (0.71) | 55% | 2.08 (0.73) |


