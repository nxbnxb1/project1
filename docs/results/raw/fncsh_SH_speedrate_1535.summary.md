# DART ablation summary

Sweep: speedrate = 1535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 87% [70, 95] | 13% [5, 30] | 0.87 (0.49) | 54.25 (12.40) | 6.34 (1.05) | 122 (46) | 2.41 (0.55) | 145.8 (54.6) | 26.3 (0.9) | 11.8 (1.0) | 2.64 (0.17) | 56% | 2.08 (0.46) |


