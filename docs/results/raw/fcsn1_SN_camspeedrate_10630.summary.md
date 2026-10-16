# DART ablation summary

Sweep: camspeedrate = 10630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.08 (0.68) | 72.97 (21.39) | 4.59 (1.07) | 108 (73) | 1.42 (0.58) | 132.0 (89.8) | 18.9 (2.7) | 7.6 (3.4) | 1.34 (0.49) | 17% | 2.60 (0.59) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.21 (0.71) | 70.46 (24.99) | 4.93 (0.91) | 205 (76) | 2.95 (0.01) | 249.8 (91.4) | 18.9 (2.6) | 7.9 (3.5) | 1.32 (0.48) | 17% | 2.94 (0.96) |


