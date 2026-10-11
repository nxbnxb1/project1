# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 47% [30, 64] | 50% [33, 67] | 0.26 (0.36) | 134.83 (46.46) | 3.14 (1.09) | 59 (38) | 0.48 (0.03) | 70.3 (46.4) | 24.8 (1.9) | 10.8 (1.9) | 2.40 (0.35) | 46% | 1.90 (0.46) |


