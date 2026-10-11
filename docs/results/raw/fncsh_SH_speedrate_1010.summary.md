# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 87% [70, 95] | 13% [5, 30] | 0.72 (0.46) | 87.13 (22.05) | 4.58 (1.19) | 76 (24) | 0.91 (0.06) | 90.4 (29.0) | 26.5 (1.3) | 15.6 (1.8) | 2.71 (0.23) | 60% | 1.92 (0.46) |


