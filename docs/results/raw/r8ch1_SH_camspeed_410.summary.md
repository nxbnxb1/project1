# DART ablation summary

Sweep: camspeed = 410

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 0.93 (0.47) | 103.87 (41.07) | 4.66 (1.26) | 170 (51) | 1.74 (0.33) | 817.3 (239.5) | 24.0 (2.3) | 8.2 (1.0) | 2.26 (0.36) | 46% | 2.40 (0.50) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 1.34 (0.55) | 79.66 (25.30) | 5.59 (0.82) | 214 (68) | 2.68 (0.02) | 1030.0 (327.6) | 24.8 (1.0) | 8.4 (0.5) | 2.36 (0.18) | 45% | 2.61 (0.58) |


