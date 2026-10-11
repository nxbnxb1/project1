# DART ablation summary

Sweep: speedrate = 1030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 97% [83, 99] | 3% [1, 17] | 0.88 (0.39) | 63.03 (21.75) | 5.85 (1.26) | 135 (59) | 2.12 (0.41) | 161.5 (70.4) | 26.4 (1.2) | 16.0 (1.3) | 2.67 (0.20) | 52% | 2.15 (0.42) |


