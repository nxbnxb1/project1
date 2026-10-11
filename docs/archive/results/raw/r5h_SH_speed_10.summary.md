# DART ablation summary

Sweep: speed = 10

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 67% [42, 85] | 0.12 (0.23) | 68.04 (20.11) | 5.87 (1.25) | 127 (91) | 3.53 (0.84) | 153.3 (109.3) | 23.7 (2.1) | 7.8 (1.5) | 2.14 (0.40) | 37% | 2.24 (0.63) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 0.90 (0.37) | 81.42 (19.03) | 5.28 (0.85) | 240 (56) | 2.95 (0.00) | 287.8 (66.4) | 25.0 (1.0) | 8.6 (0.5) | 2.41 (0.16) | 46% | 2.13 (0.38) |
| E_DART | 15 | 93% [70, 99] | 7% [1, 30] | 0.87 (0.45) | 67.67 (13.31) | 6.04 (0.96) | 314 (84) | 4.89 (0.46) | 377.0 (100.6) | 25.0 (1.3) | 8.2 (0.6) | 2.39 (0.23) | 41% | 2.29 (0.41) |


