# DART ablation summary

Sweep: speedrate = 1005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 65% [52, 76] | 35% [24, 48] | 0.75 (0.99) | 53.09 (19.13) | 6.74 (1.58) | 22 (11) | 0.48 (0.03) | 26.8 (12.8) | 22.4 (1.9) | 5.3 (2.4) | 1.78 (0.43) | 27% | 2.27 (0.95) |


