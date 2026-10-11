# DART ablation summary

Sweep: speedrate = 1020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| COV_NOCLUT | 60 | 97% [89, 99] | 3% [1, 11] | 1.45 (0.66) | 44.69 (12.28) | 7.62 (1.45) | 61 (28) | 1.34 (0.26) | 72.6 (32.5) | 23.2 (1.7) | 9.2 (3.8) | 1.91 (0.40) | 27% | 2.54 (0.82) |


