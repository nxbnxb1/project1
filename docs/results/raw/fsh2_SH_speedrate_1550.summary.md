# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 1.10 (0.13) | 50.41 (7.00) | 6.68 (0.70) | 155 (59) | 3.07 (1.04) | 187.1 (70.4) | 26.7 (0.5) | 15.7 (1.3) | 2.72 (0.11) | 45% | 2.01 (0.55) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.80 (0.40) | 62.56 (24.77) | 5.84 (1.37) | 302 (122) | 5.01 (0.01) | 362.6 (147.0) | 26.8 (1.1) | 17.4 (1.0) | 2.74 (0.20) | 53% | 2.45 (0.34) |
| E_DART | 10 | 60% [31, 83] | 40% [17, 69] | 0.54 (0.60) | 46.31 (3.85) | 6.67 (1.14) | 120 (56) | 3.58 (0.27) | 145.3 (67.0) | 26.6 (1.1) | 16.8 (1.8) | 2.68 (0.23) | 53% | 1.88 (0.38) |


