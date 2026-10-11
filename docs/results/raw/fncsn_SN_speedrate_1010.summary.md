# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 93% [84, 97] | 7% [3, 16] | 1.45 (0.96) | 52.47 (26.29) | 7.08 (1.93) | 43 (26) | 0.82 (0.09) | 52.4 (31.3) | 23.3 (2.0) | 6.9 (3.0) | 1.96 (0.45) | 32% | 2.33 (0.81) |


