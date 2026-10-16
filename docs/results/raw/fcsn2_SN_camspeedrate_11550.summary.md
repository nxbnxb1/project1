# DART ablation summary

Sweep: camspeedrate = 11550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.25 (1.33) | 49.36 (20.65) | 7.40 (2.03) | 146 (99) | 2.93 (0.77) | 179.6 (123.9) | 23.7 (1.3) | 9.6 (3.4) | 2.07 (0.27) | 29% | 2.45 (0.81) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.36 (1.01) | 46.26 (17.64) | 7.76 (1.92) | 221 (91) | 5.01 (0.01) | 271.4 (113.5) | 24.2 (1.3) | 10.3 (3.5) | 2.15 (0.29) | 33% | 2.86 (1.19) |


