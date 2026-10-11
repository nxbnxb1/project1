# DART ablation summary

Sweep: speedrate = 1520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 93% [79, 98] | 3% [1, 17] | 0.90 (0.42) | 65.74 (19.91) | 5.61 (1.35) | 104 (37) | 1.58 (0.20) | 125.0 (45.0) | 26.5 (0.7) | 12.9 (1.1) | 2.69 (0.14) | 59% | 2.05 (0.39) |


