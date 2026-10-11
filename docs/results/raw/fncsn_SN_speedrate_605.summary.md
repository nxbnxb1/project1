# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 75% [63, 84] | 22% [13, 34] | 1.04 (0.82) | 81.05 (31.08) | 4.48 (1.12) | 33 (18) | 0.42 (0.06) | 39.4 (21.8) | 19.9 (3.5) | 7.7 (3.9) | 1.52 (0.64) | 23% | 2.10 (0.59) |


