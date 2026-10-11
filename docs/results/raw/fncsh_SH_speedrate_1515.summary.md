# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 90% [74, 97] | 7% [2, 21] | 0.91 (0.40) | 68.97 (19.91) | 5.36 (1.39) | 84 (33) | 1.26 (0.13) | 100.4 (40.4) | 26.7 (1.0) | 16.0 (1.9) | 2.74 (0.20) | 60% | 2.09 (0.49) |


