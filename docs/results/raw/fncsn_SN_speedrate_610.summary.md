# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 95% [86, 98] | 5% [2, 14] | 1.10 (0.48) | 75.41 (24.71) | 4.70 (0.92) | 54 (27) | 0.69 (0.15) | 64.7 (31.8) | 20.0 (3.3) | 8.5 (4.0) | 1.52 (0.59) | 19% | 2.36 (0.69) |


