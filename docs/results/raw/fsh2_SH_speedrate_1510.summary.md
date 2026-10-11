# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.68 (0.51) | 75.69 (15.99) | 5.13 (1.17) | 61 (24) | 0.88 (0.06) | 73.7 (28.5) | 26.1 (0.9) | 14.9 (1.4) | 2.61 (0.17) | 46% | 1.93 (0.42) |
| FR_SAFE | 10 | 90% [60, 98] | 0% [0, 28] | 0.67 (0.40) | 81.48 (23.43) | 4.43 (1.23) | 84 (23) | 1.00 (0.00) | 101.3 (27.5) | 25.6 (1.7) | 14.9 (1.1) | 2.56 (0.27) | 49% | 1.90 (0.46) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.35 (0.51) | 75.29 (20.86) | 4.55 (1.00) | 73 (20) | 1.01 (0.00) | 87.5 (24.3) | 26.6 (0.7) | 15.7 (1.0) | 2.73 (0.11) | 56% | 2.15 (0.56) |


