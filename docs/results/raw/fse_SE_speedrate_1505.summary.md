# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 0% [0, 11] | 2.63 (1.43) | 39.97 (29.35) | 6.17 (2.50) | 21 (17) | 0.46 (0.02) | 25.5 (20.0) | 21.9 (3.7) | 8.6 (6.7) | 1.74 (0.81) | 26% | 3.27 (2.46) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 3.15 (2.16) | 50.54 (51.10) | 6.39 (2.47) | 25 (25) | 0.52 (0.02) | 29.6 (29.9) | 21.9 (3.7) | 8.5 (6.8) | 1.72 (0.81) | 22% | 3.58 (2.58) |
| E_DART | 30 | 93% [79, 98] | 7% [2, 21] | 2.38 (1.64) | 47.84 (39.66) | 6.20 (2.35) | 24 (19) | 0.51 (0.01) | 28.3 (23.3) | 22.1 (3.9) | 8.5 (6.8) | 1.76 (0.85) | 27% | 3.39 (2.64) |


