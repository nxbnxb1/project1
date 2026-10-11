# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.08 (0.55) | 47.65 (20.52) | 7.59 (1.71) | 90 (65) | 1.75 (0.47) | 108.8 (76.8) | 23.2 (2.0) | 9.4 (4.2) | 1.91 (0.46) | 25% | 2.87 (0.82) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.20 (0.53) | 44.58 (16.93) | 7.74 (1.56) | 132 (50) | 2.95 (0.01) | 158.2 (58.9) | 23.2 (1.8) | 9.7 (4.2) | 1.92 (0.42) | 26% | 2.78 (1.03) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.13 (0.57) | 47.79 (17.01) | 7.39 (1.58) | 90 (44) | 1.80 (0.29) | 108.4 (53.3) | 23.1 (1.9) | 9.6 (4.4) | 1.90 (0.45) | 28% | 2.70 (0.74) |


