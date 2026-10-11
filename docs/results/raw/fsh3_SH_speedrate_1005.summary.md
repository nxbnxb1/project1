# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 30% [11, 60] | 70% [40, 89] | 0.20 (0.44) | 100.90 (11.00) | 4.67 (1.66) | 33 (31) | 0.50 (0.06) | 38.8 (37.0) | 24.2 (2.8) | 9.0 (2.7) | 2.27 (0.56) | 43% | 1.83 (0.51) |
| FR_SAFE | 10 | 50% [24, 76] | 50% [24, 76] | 0.26 (0.36) | 117.06 (54.32) | 3.90 (2.06) | 43 (28) | 0.52 (0.02) | 49.5 (32.6) | 25.8 (1.9) | 10.7 (3.0) | 2.56 (0.38) | 52% | 1.81 (0.38) |
| E_DART | 10 | 50% [24, 76] | 50% [24, 76] | 0.16 (0.30) | 125.21 (19.02) | 4.03 (1.60) | 44 (24) | 0.51 (0.01) | 52.4 (28.5) | 25.8 (1.8) | 10.0 (2.8) | 2.58 (0.36) | 53% | 1.77 (0.49) |


