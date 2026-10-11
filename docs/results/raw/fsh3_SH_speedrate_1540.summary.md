# DART ablation summary

Sweep: speedrate = 1540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.92 (0.27) | 55.48 (14.52) | 6.32 (0.96) | 139 (51) | 2.48 (0.66) | 163.9 (61.9) | 26.3 (0.8) | 8.3 (0.8) | 2.64 (0.16) | 44% | 2.14 (0.40) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 1.05 (0.29) | 53.41 (8.48) | 6.49 (0.75) | 214 (34) | 4.01 (0.01) | 255.4 (40.7) | 26.4 (0.9) | 8.9 (0.7) | 2.66 (0.18) | 50% | 2.26 (0.29) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.80 (0.43) | 60.40 (18.70) | 5.87 (0.97) | 164 (67) | 2.90 (0.18) | 195.2 (80.7) | 26.8 (0.6) | 9.9 (0.8) | 2.74 (0.12) | 51% | 1.99 (0.48) |


