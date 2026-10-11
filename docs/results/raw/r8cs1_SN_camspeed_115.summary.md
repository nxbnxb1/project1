# DART ablation summary

Sweep: camspeed = 115

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 23% [12, 41] | 1.17 (1.10) | 40.10 (11.47) | 7.71 (2.58) | 61 (24) | 1.59 (0.52) | 75.1 (29.3) | 21.4 (2.3) | 4.2 (1.1) | 1.66 (0.32) | 25% | 2.86 (0.97) |
| FR_SAFE_3 | 30 | 83% [66, 93] | 17% [7, 34] | 1.49 (1.16) | 44.03 (17.01) | 8.31 (1.79) | 117 (55) | 2.96 (0.01) | 143.7 (66.2) | 22.7 (1.2) | 4.7 (1.2) | 1.85 (0.22) | 30% | 2.81 (0.69) |


