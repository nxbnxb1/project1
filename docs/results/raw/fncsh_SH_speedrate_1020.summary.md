# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 87% [70, 95] | 10% [3, 26] | 0.74 (0.41) | 67.34 (16.22) | 5.27 (1.23) | 106 (36) | 1.58 (0.22) | 127.5 (44.2) | 26.4 (0.8) | 11.6 (1.0) | 2.67 (0.15) | 54% | 2.01 (0.35) |


