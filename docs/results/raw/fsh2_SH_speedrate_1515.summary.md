# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.73 (0.53) | 87.99 (25.21) | 4.37 (1.01) | 108 (39) | 1.27 (0.15) | 130.4 (47.0) | 26.5 (1.0) | 16.4 (1.5) | 2.70 (0.20) | 53% | 2.14 (0.67) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 1.00 (0.14) | 76.39 (21.16) | 4.86 (0.90) | 114 (32) | 1.50 (0.00) | 138.1 (39.0) | 26.8 (0.8) | 15.9 (1.2) | 2.76 (0.14) | 52% | 1.90 (0.38) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.73 (0.55) | 71.66 (22.87) | 5.25 (0.94) | 88 (37) | 1.35 (0.03) | 106.3 (44.7) | 26.4 (1.3) | 16.1 (1.3) | 2.68 (0.23) | 52% | 1.85 (0.30) |


