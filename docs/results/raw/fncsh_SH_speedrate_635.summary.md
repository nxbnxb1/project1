# DART ablation summary

Sweep: speedrate = 635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 100% [89, 100] | 0% [0, 11] | 0.69 (0.31) | 79.03 (17.81) | 4.57 (0.68) | 176 (78) | 2.18 (0.64) | 211.1 (93.6) | 25.1 (0.9) | 9.2 (0.7) | 2.38 (0.19) | 25% | 2.16 (0.64) |


