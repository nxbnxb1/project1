# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 97% [83, 99] | 3% [1, 17] | 0.64 (0.38) | 73.47 (12.59) | 4.74 (0.56) | 213 (94) | 2.91 (1.03) | 255.8 (112.7) | 24.8 (1.0) | 15.2 (1.3) | 2.33 (0.19) | 22% | 2.10 (0.32) |


