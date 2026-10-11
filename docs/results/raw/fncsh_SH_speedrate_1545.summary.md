# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 87% [70, 95] | 13% [5, 30] | 0.93 (0.58) | 50.75 (12.48) | 6.75 (1.46) | 133 (53) | 2.80 (0.72) | 159.7 (64.0) | 26.3 (1.0) | 9.0 (0.9) | 2.64 (0.18) | 56% | 2.17 (0.51) |


