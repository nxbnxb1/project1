# DART ablation summary

Sweep: speedrate = 1515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 95% [86, 98] | 5% [2, 14] | 1.59 (0.93) | 39.90 (18.01) | 8.74 (1.98) | 49 (26) | 1.21 (0.09) | 59.2 (30.6) | 24.8 (1.1) | 4.9 (1.8) | 2.28 (0.25) | 39% | 2.26 (0.70) |


