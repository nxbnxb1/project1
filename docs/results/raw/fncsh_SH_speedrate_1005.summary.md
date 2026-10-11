# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 43% [27, 61] | 53% [36, 70] | 0.31 (0.48) | 115.48 (41.30) | 4.14 (1.80) | 37 (25) | 0.50 (0.04) | 44.4 (30.2) | 25.5 (2.2) | 13.9 (3.2) | 2.51 (0.43) | 55% | 2.01 (0.67) |


