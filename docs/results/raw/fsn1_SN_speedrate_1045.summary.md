# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.31 (0.51) | 46.14 (19.89) | 7.80 (1.77) | 114 (89) | 2.32 (0.68) | 136.9 (105.1) | 22.7 (1.5) | 8.7 (3.7) | 1.80 (0.37) | 21% | 2.94 (1.13) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.18 (0.40) | 43.21 (9.54) | 7.72 (1.19) | 188 (42) | 4.35 (0.01) | 226.7 (51.2) | 23.1 (1.7) | 9.6 (3.6) | 1.89 (0.39) | 25% | 2.88 (0.67) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.19 (0.49) | 41.58 (7.53) | 7.85 (1.07) | 90 (33) | 2.20 (0.43) | 108.8 (39.9) | 23.1 (1.8) | 9.1 (3.7) | 1.88 (0.40) | 25% | 2.68 (0.98) |


