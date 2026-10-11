# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 100% [94, 100] | 0% [0, 6] | 1.45 (0.62) | 40.92 (9.18) | 8.07 (1.10) | 115 (49) | 2.73 (0.67) | 138.3 (59.2) | 23.0 (1.4) | 5.5 (1.9) | 1.86 (0.34) | 25% | 2.63 (1.08) |


