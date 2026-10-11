# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.39 (0.39) | 39.48 (11.86) | 8.71 (1.85) | 91 (41) | 2.22 (0.34) | 109.3 (48.8) | 24.8 (1.2) | 10.0 (3.9) | 2.27 (0.25) | 30% | 2.69 (1.09) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.38 (0.35) | 37.03 (7.88) | 8.90 (1.52) | 128 (27) | 3.46 (0.01) | 154.2 (33.0) | 25.0 (1.1) | 10.5 (3.9) | 2.32 (0.25) | 33% | 3.03 (0.97) |
| E_DART | 20 | 85% [64, 95] | 10% [3, 30] | 1.03 (0.54) | 39.13 (12.60) | 8.54 (2.36) | 104 (52) | 2.47 (0.19) | 124.5 (63.7) | 24.7 (0.9) | 9.7 (4.0) | 2.27 (0.21) | 32% | 2.79 (0.98) |


