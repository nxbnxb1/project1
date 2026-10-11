# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 1.03 (0.20) | 69.91 (18.32) | 5.29 (1.00) | 128 (52) | 1.80 (0.37) | 154.0 (61.4) | 26.1 (0.8) | 8.8 (0.9) | 2.61 (0.17) | 44% | 2.06 (0.46) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.85 (0.36) | 61.70 (13.17) | 5.63 (0.87) | 146 (41) | 2.51 (0.01) | 175.8 (48.1) | 26.5 (0.8) | 9.6 (0.7) | 2.70 (0.16) | 47% | 2.26 (0.70) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.93 (0.30) | 65.54 (19.06) | 5.55 (0.95) | 129 (38) | 1.97 (0.09) | 155.7 (47.3) | 26.4 (0.7) | 9.4 (0.5) | 2.67 (0.11) | 48% | 2.10 (0.48) |


