# DART ablation summary

Sweep: speedrate = 1510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 87% [76, 93] | 13% [7, 24] | 1.31 (1.09) | 46.19 (19.33) | 7.68 (2.30) | 40 (21) | 0.89 (0.08) | 48.9 (25.3) | 24.2 (1.9) | 6.4 (2.6) | 2.16 (0.38) | 38% | 2.37 (0.87) |


