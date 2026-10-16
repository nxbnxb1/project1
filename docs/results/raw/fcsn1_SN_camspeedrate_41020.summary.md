# DART ablation summary

Sweep: camspeedrate = 41020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.27 (0.63) | 46.37 (14.97) | 7.54 (1.50) | 56 (32) | 1.23 (0.29) | 270.6 (155.5) | 23.0 (1.8) | 4.7 (1.9) | 1.88 (0.39) | 24% | 2.42 (0.82) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.30 (0.59) | 50.00 (17.26) | 7.23 (1.56) | 99 (34) | 2.00 (0.01) | 476.0 (167.4) | 23.1 (1.7) | 4.9 (2.0) | 1.90 (0.37) | 28% | 2.61 (0.73) |


