# DART ablation summary

Sweep: speedrate = 1505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 40% [17, 69] | 60% [31, 83] | 0.39 (0.64) | 110.97 (36.95) | 4.41 (1.10) | 33 (22) | 0.49 (0.03) | 40.5 (26.5) | 26.0 (1.1) | 13.9 (2.1) | 2.61 (0.20) | 51% | 1.99 (0.64) |
| FR_SAFE | 10 | 40% [17, 69] | 60% [31, 83] | 0.27 (0.46) | 122.77 (18.76) | 3.84 (1.23) | 38 (28) | 0.52 (0.03) | 46.4 (33.9) | 25.8 (1.5) | 14.7 (2.5) | 2.57 (0.30) | 44% | 2.12 (0.60) |
| E_DART | 10 | 30% [11, 60] | 60% [31, 83] | 0.42 (0.74) | 116.16 (46.93) | 3.80 (1.93) | 37 (25) | 0.52 (0.03) | 45.3 (30.1) | 25.8 (2.1) | 14.5 (3.6) | 2.58 (0.41) | 56% | 1.92 (0.51) |


