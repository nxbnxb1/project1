# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 97% [89, 99] | 3% [1, 11] | 1.45 (0.67) | 43.87 (12.84) | 7.80 (1.41) | 82 (40) | 1.81 (0.40) | 98.7 (47.2) | 23.3 (1.7) | 9.6 (3.7) | 1.93 (0.39) | 28% | 2.58 (0.84) |


