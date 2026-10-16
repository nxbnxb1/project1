# DART ablation summary

Sweep: camspeedrate = 10645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.03 (0.58) | 71.55 (26.13) | 4.88 (0.97) | 141 (111) | 1.77 (0.75) | 171.5 (134.5) | 18.6 (2.9) | 5.6 (2.6) | 1.27 (0.51) | 16% | 2.57 (0.85) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.02 (0.52) | 77.22 (30.86) | 4.77 (0.97) | 339 (132) | 4.35 (0.01) | 413.8 (159.5) | 18.7 (2.6) | 6.6 (2.6) | 1.29 (0.45) | 17% | 2.96 (0.69) |


