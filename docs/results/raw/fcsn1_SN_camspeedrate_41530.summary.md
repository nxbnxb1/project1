# DART ablation summary

Sweep: camspeedrate = 41530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.47 (0.74) | 39.80 (10.10) | 8.58 (1.63) | 71 (26) | 1.74 (0.26) | 340.9 (127.1) | 24.7 (1.1) | 9.9 (3.8) | 2.26 (0.24) | 33% | 2.40 (0.77) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.18 (0.71) | 43.05 (17.21) | 8.40 (1.77) | 112 (46) | 2.69 (0.02) | 539.5 (220.7) | 24.6 (1.0) | 10.2 (3.7) | 2.25 (0.22) | 35% | 2.58 (0.68) |


