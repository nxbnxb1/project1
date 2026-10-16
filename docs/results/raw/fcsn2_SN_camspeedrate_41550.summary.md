# DART ablation summary

Sweep: camspeedrate = 41550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.57 (1.30) | 42.37 (15.14) | 8.32 (1.83) | 82 (44) | 1.87 (0.32) | 395.2 (211.6) | 24.6 (1.2) | 5.0 (1.6) | 2.24 (0.26) | 33% | 2.42 (0.68) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.40 (0.69) | 40.23 (9.12) | 8.35 (1.62) | 118 (26) | 2.94 (0.06) | 564.2 (127.2) | 24.8 (1.0) | 5.5 (1.6) | 2.29 (0.21) | 36% | 2.60 (0.86) |


