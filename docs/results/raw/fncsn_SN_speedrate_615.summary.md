# DART ablation summary

Sweep: speedrate = 615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 95% [86, 98] | 5% [2, 14] | 1.14 (0.50) | 67.30 (16.38) | 5.02 (0.82) | 63 (29) | 0.92 (0.22) | 75.9 (34.9) | 19.3 (2.9) | 4.5 (2.1) | 1.38 (0.52) | 14% | 2.57 (0.87) |


