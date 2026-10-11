# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.59 (0.42) | 77.38 (18.25) | 4.28 (0.90) | 211 (76) | 2.62 (0.76) | 253.2 (91.3) | 25.5 (0.9) | 15.5 (1.4) | 2.45 (0.19) | 27% | 2.25 (0.47) |
| FR_SAFE | 10 | 90% [60, 98] | 10% [2, 40] | 0.76 (0.33) | 80.23 (25.35) | 4.57 (0.81) | 326 (97) | 4.01 (0.00) | 388.9 (111.2) | 24.9 (1.1) | 15.4 (1.1) | 2.33 (0.22) | 26% | 2.29 (0.48) |
| E_DART | 10 | 70% [40, 89] | 30% [11, 60] | 0.69 (0.53) | 72.65 (9.67) | 4.72 (0.35) | 149 (60) | 2.38 (0.18) | 179.9 (72.7) | 25.1 (1.4) | 15.1 (1.6) | 2.37 (0.25) | 25% | 2.27 (0.60) |


