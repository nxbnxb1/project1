# DART ablation summary

Sweep: camspeedrate = 21515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 2.13 (1.47) | 39.22 (46.38) | 7.18 (2.34) | 37 (63) | 0.89 (0.34) | 44.6 (76.2) | 21.4 (2.5) | 6.2 (4.6) | 1.61 (0.59) | 21% | 3.35 (2.51) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.41 (1.83) | 32.88 (17.11) | 7.13 (2.20) | 49 (25) | 1.51 (0.01) | 58.6 (28.9) | 21.6 (2.6) | 6.7 (4.9) | 1.66 (0.60) | 23% | 3.51 (2.29) |


