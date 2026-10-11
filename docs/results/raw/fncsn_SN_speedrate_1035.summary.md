# DART ablation summary

Sweep: speedrate = 1035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 98% [91, 100] | 2% [0, 9] | 1.49 (0.56) | 41.35 (9.72) | 7.98 (1.30) | 84 (36) | 2.00 (0.48) | 101.5 (43.1) | 23.1 (1.6) | 9.4 (3.6) | 1.89 (0.38) | 27% | 2.66 (0.76) |


