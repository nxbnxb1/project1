# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 20% [6, 51] | 0.77 (0.48) | 71.61 (13.97) | 4.98 (1.37) | 82 (35) | 1.23 (0.18) | 97.0 (42.6) | 26.6 (1.4) | 15.6 (2.8) | 2.71 (0.28) | 50% | 2.17 (0.61) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.70 (0.34) | 82.35 (33.44) | 5.00 (1.29) | 114 (56) | 1.50 (0.00) | 134.9 (67.2) | 26.5 (1.1) | 15.8 (2.4) | 2.69 (0.22) | 51% | 2.23 (0.35) |
| E_DART | 10 | 80% [49, 94] | 20% [6, 51] | 0.85 (0.52) | 67.14 (10.71) | 5.04 (0.95) | 93 (16) | 1.35 (0.03) | 111.1 (21.1) | 26.0 (0.9) | 15.6 (1.4) | 2.61 (0.18) | 46% | 2.16 (0.29) |


