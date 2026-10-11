# DART ablation summary

Sweep: speedrate = 645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 90% [74, 97] | 10% [3, 26] | 0.74 (0.36) | 76.68 (14.10) | 4.69 (0.52) | 194 (91) | 2.64 (0.90) | 232.5 (110.5) | 24.7 (1.1) | 14.0 (1.4) | 2.30 (0.21) | 22% | 2.18 (0.42) |


