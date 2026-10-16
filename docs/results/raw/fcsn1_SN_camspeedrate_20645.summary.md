# DART ablation summary

Sweep: camspeedrate = 20645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.25 (0.57) | 69.20 (19.96) | 4.79 (1.13) | 146 (101) | 1.83 (0.74) | 174.7 (121.6) | 18.6 (2.6) | 7.3 (3.4) | 1.27 (0.46) | 14% | 2.49 (0.93) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.08 (0.70) | 70.08 (21.31) | 4.94 (0.88) | 304 (97) | 4.36 (0.01) | 364.3 (114.9) | 19.0 (2.9) | 8.3 (3.6) | 1.34 (0.51) | 16% | 3.15 (0.85) |


