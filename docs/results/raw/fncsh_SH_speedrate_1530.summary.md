# DART ablation summary

Sweep: speedrate = 1530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 97% [83, 99] | 3% [1, 17] | 0.98 (0.38) | 53.10 (13.22) | 6.70 (0.92) | 105 (39) | 2.01 (0.46) | 125.6 (46.9) | 26.2 (0.9) | 15.5 (1.6) | 2.63 (0.17) | 56% | 2.07 (0.45) |


