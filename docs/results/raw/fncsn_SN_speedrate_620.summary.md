# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 97% [89, 99] | 2% [0, 9] | 1.15 (0.43) | 65.43 (15.21) | 5.10 (0.82) | 80 (43) | 1.18 (0.32) | 96.7 (52.2) | 19.2 (2.8) | 8.2 (3.5) | 1.37 (0.50) | 13% | 2.66 (0.75) |


