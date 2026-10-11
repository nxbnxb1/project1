# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.20 (0.69) | 44.33 (10.21) | 7.70 (1.59) | 54 (15) | 1.21 (0.08) | 66.0 (17.6) | 25.1 (1.2) | 7.7 (2.1) | 2.36 (0.24) | 37% | 2.31 (0.59) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.47 (0.59) | 48.52 (19.27) | 7.48 (2.12) | 73 (29) | 1.51 (0.01) | 88.3 (33.5) | 25.0 (1.1) | 7.8 (2.3) | 2.35 (0.25) | 38% | 2.51 (1.05) |
| E_DART | 20 | 95% [76, 99] | 0% [0, 16] | 1.27 (0.70) | 46.25 (15.22) | 7.42 (2.34) | 64 (21) | 1.33 (0.05) | 77.4 (25.8) | 24.9 (1.0) | 7.6 (2.3) | 2.33 (0.21) | 39% | 2.18 (0.64) |


