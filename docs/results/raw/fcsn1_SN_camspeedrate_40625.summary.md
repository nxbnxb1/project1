# DART ablation summary

Sweep: camspeedrate = 40625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.13 (0.60) | 66.05 (15.74) | 5.04 (0.73) | 83 (48) | 1.16 (0.39) | 397.3 (233.4) | 19.1 (2.9) | 7.9 (3.7) | 1.35 (0.51) | 13% | 2.38 (0.70) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.26 (0.57) | 68.78 (17.80) | 5.11 (0.66) | 166 (43) | 2.43 (0.01) | 802.1 (201.1) | 19.1 (3.1) | 8.4 (4.0) | 1.35 (0.55) | 15% | 2.93 (0.99) |


