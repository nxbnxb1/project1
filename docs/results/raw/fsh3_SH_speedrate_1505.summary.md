# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 30% [11, 60] | 60% [31, 83] | 0.21 (0.38) | 83.88 (11.82) | 4.46 (1.85) | 30 (25) | 0.50 (0.06) | 34.8 (29.0) | 24.4 (3.0) | 12.2 (3.9) | 2.31 (0.59) | 44% | 2.25 (0.63) |
| FR_SAFE | 10 | 40% [17, 69] | 60% [31, 83] | 0.11 (0.22) | 122.61 (23.49) | 4.48 (2.04) | 36 (27) | 0.52 (0.02) | 41.8 (31.3) | 25.7 (2.2) | 13.4 (3.6) | 2.52 (0.40) | 45% | 1.96 (0.62) |
| E_DART | 10 | 40% [17, 69] | 50% [24, 76] | 0.21 (0.34) | 109.31 (35.13) | 3.96 (2.06) | 43 (24) | 0.51 (0.02) | 51.0 (29.6) | 25.3 (2.2) | 12.8 (3.9) | 2.50 (0.41) | 53% | 1.67 (0.36) |


