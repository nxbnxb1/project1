# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 83% [66, 93] | 17% [7, 34] | 0.82 (0.44) | 59.82 (15.70) | 5.91 (1.05) | 133 (69) | 2.41 (0.62) | 159.6 (83.2) | 26.5 (0.9) | 9.1 (0.9) | 2.69 (0.18) | 54% | 2.24 (0.55) |


