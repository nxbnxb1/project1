# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.47 (0.45) | 43.12 (14.05) | 7.82 (1.28) | 100 (61) | 2.20 (0.57) | 118.8 (73.6) | 22.8 (1.5) | 6.6 (2.7) | 1.83 (0.35) | 23% | 2.49 (0.69) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.23 (0.40) | 41.64 (12.21) | 7.97 (1.20) | 167 (49) | 4.01 (0.01) | 198.5 (56.0) | 22.9 (1.8) | 6.6 (2.7) | 1.84 (0.41) | 24% | 2.50 (0.85) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.19 (0.44) | 41.77 (10.09) | 7.93 (1.20) | 86 (32) | 2.02 (0.37) | 102.0 (37.9) | 22.7 (1.7) | 6.0 (2.4) | 1.80 (0.37) | 22% | 2.48 (0.92) |


