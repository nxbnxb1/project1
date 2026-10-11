# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.68 (0.51) | 68.20 (20.14) | 5.55 (1.49) | 115 (61) | 2.11 (0.48) | 136.5 (72.7) | 25.9 (1.3) | 16.3 (1.8) | 2.58 (0.23) | 47% | 2.39 (0.75) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.73 (0.28) | 73.96 (30.39) | 5.34 (1.10) | 218 (90) | 2.95 (0.01) | 260.3 (108.1) | 26.7 (0.5) | 17.6 (1.0) | 2.71 (0.11) | 53% | 2.32 (0.46) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.65 (0.41) | 66.11 (20.09) | 5.44 (1.33) | 147 (44) | 2.32 (0.15) | 174.9 (51.9) | 26.4 (0.9) | 16.7 (1.6) | 2.68 (0.18) | 53% | 2.41 (0.62) |


