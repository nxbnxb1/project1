# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 60% [31, 83] | 10% [2, 40] | 0.71 (0.43) | 119.97 (32.51) | 2.88 (1.17) | 48 (17) | 0.47 (0.03) | 58.9 (20.2) | 25.3 (1.3) | 14.2 (2.3) | 2.49 (0.23) | 48% | 1.93 (0.42) |
| FR_SAFE | 10 | 60% [31, 83] | 30% [11, 60] | 0.53 (0.55) | 164.51 (22.00) | 2.55 (0.42) | 63 (27) | 0.51 (0.00) | 76.9 (31.6) | 25.8 (1.6) | 14.7 (2.1) | 2.59 (0.25) | 46% | 1.83 (0.41) |
| E_DART | 10 | 40% [17, 69] | 50% [24, 76] | 0.47 (0.56) | 166.56 (57.51) | 2.73 (0.88) | 52 (33) | 0.51 (0.00) | 62.9 (38.8) | 26.0 (1.0) | 14.8 (1.6) | 2.62 (0.18) | 52% | 2.04 (0.71) |


