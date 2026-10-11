# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 100% [72, 100] | 0% [0, 28] | 0.70 (0.32) | 73.48 (11.61) | 4.72 (0.50) | 164 (69) | 2.21 (0.81) | 197.3 (83.6) | 24.7 (1.0) | 10.7 (1.1) | 2.31 (0.18) | 21% | 2.22 (0.51) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.67 (0.42) | 73.04 (8.60) | 4.80 (0.45) | 237 (55) | 3.46 (0.01) | 285.5 (65.6) | 25.4 (0.9) | 11.7 (0.6) | 2.44 (0.17) | 24% | 2.15 (0.41) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.77 (0.44) | 78.73 (20.82) | 4.56 (0.73) | 163 (39) | 2.08 (0.11) | 196.3 (48.4) | 24.7 (1.2) | 10.9 (0.6) | 2.30 (0.19) | 21% | 2.12 (0.33) |


