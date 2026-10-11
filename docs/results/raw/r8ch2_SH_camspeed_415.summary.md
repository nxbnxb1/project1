# DART ablation summary

Sweep: camspeed = 415

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 1.07 (0.61) | 92.85 (41.52) | 5.16 (1.90) | 138 (54) | 1.61 (0.37) | 662.7 (258.3) | 23.5 (2.4) | 7.8 (1.1) | 2.16 (0.37) | 43% | 2.21 (0.59) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 1.15 (0.42) | 67.51 (17.90) | 5.91 (1.00) | 181 (48) | 2.69 (0.02) | 870.9 (233.0) | 25.2 (1.3) | 8.4 (1.2) | 2.43 (0.25) | 45% | 2.37 (0.37) |


