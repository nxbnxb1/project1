# DART ablation summary

Sweep: camspeedrate = 11045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.22 (0.74) | 50.50 (17.94) | 7.26 (1.62) | 108 (76) | 2.13 (0.64) | 131.7 (90.3) | 22.5 (1.6) | 5.8 (2.1) | 1.79 (0.35) | 25% | 2.55 (0.75) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.27 (0.64) | 44.47 (13.67) | 7.50 (1.39) | 193 (56) | 4.36 (0.01) | 236.0 (67.6) | 22.9 (1.6) | 6.6 (2.6) | 1.86 (0.36) | 26% | 2.89 (1.09) |


