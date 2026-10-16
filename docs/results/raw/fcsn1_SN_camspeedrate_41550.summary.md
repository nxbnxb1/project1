# DART ablation summary

Sweep: camspeedrate = 41550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.33 (0.48) | 41.05 (12.70) | 8.52 (1.69) | 78 (35) | 1.85 (0.26) | 376.4 (168.5) | 24.8 (1.0) | 9.6 (3.5) | 2.27 (0.23) | 34% | 2.55 (0.88) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.32 (0.45) | 40.92 (10.95) | 8.47 (1.58) | 119 (32) | 2.91 (0.05) | 574.2 (153.1) | 24.8 (1.4) | 10.4 (4.0) | 2.29 (0.29) | 36% | 2.67 (0.92) |


