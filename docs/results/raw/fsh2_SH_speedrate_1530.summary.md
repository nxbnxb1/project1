# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.81 (0.29) | 53.23 (9.14) | 6.41 (0.76) | 106 (32) | 2.01 (0.56) | 127.5 (37.4) | 26.6 (0.7) | 11.8 (0.8) | 2.69 (0.13) | 45% | 1.89 (0.35) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.90 (0.33) | 65.07 (21.55) | 5.67 (1.13) | 188 (61) | 2.95 (0.00) | 225.7 (72.6) | 26.2 (1.6) | 12.5 (1.0) | 2.64 (0.26) | 53% | 2.07 (0.52) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.91 (0.39) | 64.55 (19.06) | 5.52 (1.12) | 148 (45) | 2.29 (0.11) | 178.2 (53.7) | 26.7 (0.5) | 12.5 (0.6) | 2.73 (0.11) | 52% | 2.13 (0.40) |


