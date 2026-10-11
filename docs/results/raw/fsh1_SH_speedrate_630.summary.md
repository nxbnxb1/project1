# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 80% [49, 94] | 20% [6, 51] | 0.43 (0.36) | 86.74 (19.32) | 4.38 (0.71) | 170 (79) | 2.02 (0.55) | 204.3 (93.2) | 25.0 (1.7) | 15.3 (1.5) | 2.36 (0.29) | 26% | 2.27 (0.48) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.86 (0.23) | 73.48 (4.84) | 4.75 (0.26) | 217 (14) | 2.95 (0.00) | 260.7 (17.6) | 25.4 (1.0) | 15.7 (0.9) | 2.43 (0.19) | 23% | 2.33 (0.41) |
| E_DART | 10 | 100% [72, 100] | 0% [0, 28] | 0.78 (0.35) | 86.16 (27.22) | 4.43 (0.89) | 170 (60) | 1.96 (0.16) | 204.2 (73.3) | 25.2 (1.1) | 15.3 (1.1) | 2.41 (0.21) | 26% | 2.20 (0.60) |


