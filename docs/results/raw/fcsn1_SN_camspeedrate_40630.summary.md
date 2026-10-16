# DART ablation summary

Sweep: camspeedrate = 40630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.19 (0.54) | 64.75 (12.40) | 5.13 (0.66) | 78 (38) | 1.23 (0.44) | 374.1 (185.9) | 19.0 (3.1) | 5.6 (2.8) | 1.33 (0.54) | 13% | 2.36 (0.80) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.14 (0.49) | 66.79 (13.26) | 5.22 (0.49) | 172 (44) | 2.68 (0.03) | 829.8 (209.6) | 18.7 (2.6) | 5.8 (2.5) | 1.27 (0.46) | 12% | 2.74 (0.92) |


