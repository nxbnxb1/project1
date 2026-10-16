# DART ablation summary

Sweep: camspeedrate = 10610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 2.07 (1.45) | 62.69 (56.30) | 4.49 (1.77) | 52 (66) | 0.54 (0.28) | 63.4 (80.7) | 18.2 (4.4) | 6.6 (5.1) | 1.24 (0.80) | 15% | 3.65 (2.95) |
| FR_SAFE | 30 | 83% [66, 93] | 13% [5, 30] | 2.36 (1.76) | 54.22 (42.34) | 4.53 (1.73) | 66 (62) | 1.01 (0.01) | 81.2 (75.5) | 18.3 (4.1) | 6.8 (5.0) | 1.26 (0.74) | 14% | 4.01 (3.18) |


