# DART ablation summary

Sweep: speed = 6

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 100% [80, 100] | 0% [0, 20] | 1.28 (0.30) | 82.86 (32.06) | 4.63 (1.07) | 139 (74) | 1.64 (0.32) | 167.8 (88.2) | 19.9 (2.9) | 4.3 (1.5) | 1.51 (0.51) | 20% | 2.46 (0.70) |
| COV_NOCLUT | 15 | 100% [80, 100] | 0% [0, 20] | 1.17 (0.36) | 75.05 (21.19) | 4.78 (0.87) | 111 (24) | 1.51 (0.27) | 133.5 (28.7) | 18.9 (1.7) | 3.7 (0.6) | 1.34 (0.27) | 13% | 2.65 (0.55) |


