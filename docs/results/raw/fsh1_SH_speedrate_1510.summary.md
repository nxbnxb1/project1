# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 70% [40, 89] | 30% [11, 60] | 0.64 (0.51) | 88.86 (30.75) | 4.68 (1.58) | 64 (37) | 0.92 (0.06) | 77.5 (44.8) | 26.0 (0.9) | 15.0 (1.4) | 2.62 (0.15) | 54% | 2.08 (0.51) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.95 (0.48) | 97.26 (28.51) | 4.38 (1.13) | 88 (40) | 1.01 (0.01) | 106.7 (48.4) | 26.1 (1.5) | 15.3 (1.8) | 2.65 (0.26) | 51% | 1.92 (0.28) |
| E_DART | 10 | 50% [24, 76] | 30% [11, 60] | 0.60 (0.53) | 105.84 (38.27) | 4.17 (1.49) | 93 (44) | 1.01 (0.01) | 111.8 (52.1) | 26.9 (0.9) | 16.3 (1.3) | 2.77 (0.17) | 58% | 2.20 (0.43) |


