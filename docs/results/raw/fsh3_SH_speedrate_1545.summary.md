# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.81 (0.27) | 58.65 (9.40) | 6.06 (0.84) | 156 (57) | 2.62 (0.71) | 185.2 (68.4) | 26.2 (0.7) | 7.9 (0.6) | 2.63 (0.14) | 46% | 2.05 (0.40) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.87 (0.34) | 58.10 (10.00) | 6.26 (0.87) | 235 (72) | 4.36 (0.00) | 280.0 (86.9) | 26.6 (0.7) | 9.5 (0.8) | 2.69 (0.14) | 50% | 2.17 (0.61) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.64 (0.35) | 59.36 (10.85) | 6.05 (0.97) | 176 (51) | 3.16 (0.16) | 208.5 (59.7) | 26.9 (0.9) | 9.7 (0.7) | 2.76 (0.17) | 54% | 2.18 (0.48) |


