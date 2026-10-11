# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.75 (0.34) | 69.85 (13.77) | 5.22 (0.94) | 169 (60) | 2.36 (0.49) | 200.3 (72.9) | 26.4 (1.2) | 16.6 (1.3) | 2.67 (0.22) | 51% | 2.07 (0.38) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.97 (0.42) | 56.77 (17.13) | 6.33 (1.11) | 192 (57) | 3.46 (0.01) | 228.4 (69.1) | 26.3 (1.1) | 16.3 (1.1) | 2.63 (0.20) | 49% | 2.23 (0.59) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.76 (0.39) | 59.69 (11.54) | 5.87 (0.72) | 142 (26) | 2.49 (0.22) | 168.3 (30.6) | 26.3 (1.0) | 16.2 (1.6) | 2.64 (0.20) | 49% | 2.00 (0.48) |


