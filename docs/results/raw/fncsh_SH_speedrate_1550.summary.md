# DART ablation summary

Sweep: speedrate = 1550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 30 | 93% [79, 98] | 7% [2, 21] | 0.93 (0.37) | 50.95 (10.40) | 6.98 (1.07) | 149 (69) | 3.06 (0.96) | 178.8 (81.6) | 26.3 (0.8) | 15.5 (1.3) | 2.63 (0.15) | 56% | 2.09 (0.47) |


