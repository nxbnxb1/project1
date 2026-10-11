# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 90% [74, 97] | 10% [3, 26] | 0.76 (0.41) | 84.39 (20.84) | 4.38 (0.68) | 137 (63) | 1.76 (0.43) | 164.7 (76.1) | 24.9 (1.5) | 10.9 (1.5) | 2.36 (0.27) | 27% | 2.14 (0.40) |


