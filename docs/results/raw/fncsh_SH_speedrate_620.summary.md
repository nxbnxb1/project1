# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 83% [66, 93] | 13% [5, 30] | 0.67 (0.41) | 91.81 (31.63) | 4.16 (0.97) | 128 (65) | 1.49 (0.30) | 153.1 (79.3) | 24.8 (1.6) | 8.3 (1.3) | 2.34 (0.31) | 29% | 2.20 (0.59) |


