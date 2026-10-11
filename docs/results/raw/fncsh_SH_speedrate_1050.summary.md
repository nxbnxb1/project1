# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 87% [70, 95] | 13% [5, 30] | 0.73 (0.44) | 51.66 (5.61) | 6.58 (0.54) | 147 (53) | 3.12 (0.99) | 175.9 (64.6) | 26.5 (0.7) | 15.9 (1.5) | 2.67 (0.15) | 50% | 1.96 (0.47) |


