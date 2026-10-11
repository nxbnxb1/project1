# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 95% [86, 98] | 5% [2, 14] | 1.09 (0.50) | 62.42 (12.78) | 5.29 (0.56) | 109 (52) | 1.71 (0.51) | 130.4 (62.1) | 18.9 (2.6) | 4.1 (1.8) | 1.29 (0.46) | 10% | 2.75 (0.76) |


