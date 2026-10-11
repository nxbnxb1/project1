# DART ablation summary

Sweep: speedrate = 605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 97% [83, 99] | 0% [0, 11] | 2.62 (1.50) | 68.04 (63.17) | 4.51 (1.68) | 30 (32) | 0.39 (0.08) | 35.8 (38.0) | 19.9 (5.5) | 8.3 (6.5) | 1.53 (1.00) | 21% | 3.24 (2.48) |


