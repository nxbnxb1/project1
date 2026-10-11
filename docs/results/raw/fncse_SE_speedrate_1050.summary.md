# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 100% [89, 100] | 0% [0, 11] | 3.01 (1.36) | 25.91 (5.39) | 8.11 (1.09) | 64 (41) | 2.31 (1.12) | 76.5 (48.7) | 22.2 (2.7) | 8.1 (4.9) | 1.77 (0.63) | 26% | 3.48 (2.51) |


