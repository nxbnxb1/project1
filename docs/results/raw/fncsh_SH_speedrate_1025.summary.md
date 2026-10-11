# DART ablation summary

Sweep: speedrate = 1025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 93% [79, 98] | 7% [2, 21] | 0.82 (0.40) | 68.70 (23.32) | 5.58 (1.26) | 124 (66) | 1.84 (0.36) | 147.8 (79.0) | 26.4 (1.1) | 14.9 (1.5) | 2.67 (0.21) | 53% | 2.21 (0.59) |


