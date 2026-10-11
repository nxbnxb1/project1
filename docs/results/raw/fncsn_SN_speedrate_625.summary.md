# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.10 (0.37) | 64.22 (12.68) | 5.22 (0.60) | 91 (41) | 1.36 (0.40) | 109.0 (48.9) | 19.0 (2.7) | 7.3 (3.1) | 1.32 (0.48) | 11% | 2.58 (0.84) |


