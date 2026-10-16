# DART ablation summary

Sweep: camspeedrate = 41545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.39 (0.59) | 39.29 (11.15) | 8.70 (1.75) | 74 (32) | 1.81 (0.27) | 353.8 (157.6) | 24.8 (1.2) | 9.2 (3.5) | 2.28 (0.25) | 33% | 2.60 (0.85) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.26 (0.58) | 42.56 (15.01) | 8.27 (1.76) | 124 (44) | 2.91 (0.05) | 596.5 (209.5) | 24.3 (1.3) | 9.8 (3.6) | 2.19 (0.26) | 34% | 2.74 (1.01) |


