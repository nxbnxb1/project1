# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.90 (0.43) | 62.93 (15.35) | 5.69 (1.13) | 148 (50) | 2.35 (0.55) | 178.1 (60.7) | 26.6 (0.4) | 9.9 (0.5) | 2.70 (0.08) | 48% | 2.10 (0.40) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.68 (0.21) | 57.68 (11.93) | 6.06 (0.87) | 199 (41) | 3.46 (0.01) | 239.9 (50.3) | 26.7 (0.5) | 10.2 (0.3) | 2.72 (0.10) | 51% | 2.00 (0.31) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.74 (0.54) | 56.77 (7.42) | 5.59 (1.14) | 141 (25) | 2.64 (0.19) | 170.1 (30.9) | 27.0 (0.6) | 10.3 (0.8) | 2.77 (0.14) | 54% | 2.27 (0.38) |


