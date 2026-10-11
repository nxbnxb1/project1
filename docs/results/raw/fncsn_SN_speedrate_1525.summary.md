# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 100% [94, 100] | 0% [0, 6] | 1.60 (1.00) | 40.06 (16.87) | 8.93 (2.09) | 74 (41) | 1.78 (0.23) | 88.9 (49.6) | 24.8 (1.2) | 9.6 (3.6) | 2.28 (0.26) | 36% | 2.59 (0.98) |


