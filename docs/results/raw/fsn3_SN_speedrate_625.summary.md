# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.09 (0.35) | 67.92 (18.36) | 5.05 (0.78) | 103 (53) | 1.45 (0.41) | 124.4 (63.4) | 19.6 (2.6) | 8.7 (3.1) | 1.42 (0.46) | 13% | 2.41 (0.68) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.10 (0.32) | 65.41 (12.83) | 5.11 (0.61) | 164 (32) | 2.51 (0.00) | 197.5 (37.9) | 19.6 (2.6) | 8.9 (3.0) | 1.43 (0.46) | 14% | 2.76 (0.68) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.03 (0.36) | 69.44 (16.66) | 4.91 (0.81) | 108 (39) | 1.51 (0.20) | 130.4 (48.2) | 20.1 (2.3) | 9.3 (2.6) | 1.53 (0.41) | 19% | 2.47 (0.91) |


