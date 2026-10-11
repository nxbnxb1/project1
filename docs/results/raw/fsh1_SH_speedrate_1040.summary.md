# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.71 (0.41) | 69.56 (16.01) | 5.18 (0.98) | 174 (67) | 2.80 (0.59) | 209.8 (78.9) | 26.5 (0.9) | 19.0 (1.7) | 2.69 (0.17) | 48% | 2.30 (0.76) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.79 (0.42) | 64.99 (16.18) | 5.55 (0.89) | 255 (63) | 4.01 (0.01) | 306.5 (75.7) | 26.3 (0.8) | 18.7 (0.8) | 2.64 (0.15) | 47% | 2.36 (0.39) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.78 (0.37) | 57.62 (10.59) | 6.08 (0.62) | 167 (33) | 2.89 (0.13) | 201.4 (41.3) | 26.8 (0.5) | 18.2 (0.8) | 2.74 (0.12) | 45% | 2.17 (0.41) |


