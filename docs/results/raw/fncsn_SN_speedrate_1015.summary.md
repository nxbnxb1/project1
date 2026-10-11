# DART ablation summary

Sweep: speedrate = 1015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.51 (0.75) | 48.87 (20.62) | 7.44 (1.76) | 55 (32) | 1.08 (0.17) | 66.1 (37.9) | 23.3 (1.7) | 6.9 (2.8) | 1.94 (0.40) | 28% | 2.41 (0.82) |


