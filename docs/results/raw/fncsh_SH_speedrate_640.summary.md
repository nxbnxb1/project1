# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 87% [70, 95] | 13% [5, 30] | 0.73 (0.38) | 75.79 (16.72) | 4.67 (0.61) | 170 (97) | 2.49 (0.85) | 203.7 (116.6) | 24.7 (1.3) | 14.9 (1.7) | 2.31 (0.24) | 25% | 2.16 (0.46) |


