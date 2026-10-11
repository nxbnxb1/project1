# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 100% [89, 100] | 0% [0, 11] | 2.30 (0.96) | 38.39 (9.02) | 5.43 (0.58) | 74 (54) | 1.83 (1.02) | 88.0 (64.0) | 19.3 (4.8) | 6.0 (3.9) | 1.42 (0.85) | 6% | 3.81 (2.82) |


