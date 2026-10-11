# DART ablation summary

Sweep: speedrate = 1525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 97% [83, 99] | 3% [1, 17] | 1.00 (0.45) | 60.92 (18.94) | 6.02 (1.27) | 112 (52) | 1.85 (0.36) | 133.6 (60.5) | 26.3 (1.0) | 15.7 (1.7) | 2.65 (0.19) | 57% | 2.10 (0.58) |


