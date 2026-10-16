# DART ablation summary

Sweep: camspeedrate = 21505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 17% [7, 34] | 83% [66, 93] | 0.00 (0.14) | 46.79 (20.47) | 8.14 (2.22) | 12 (10) | 0.51 (0.07) | 13.9 (11.9) | 21.0 (1.6) | 2.3 (1.1) | 1.45 (0.36) | 16% | 2.82 (1.49) |
| FR_SAFE | 30 | 43% [27, 61] | 57% [39, 73] | 0.34 (0.77) | 37.95 (6.35) | 8.02 (1.88) | 16 (13) | 0.53 (0.05) | 19.7 (16.0) | 20.9 (1.8) | 2.5 (1.4) | 1.45 (0.40) | 18% | 2.83 (1.21) |


