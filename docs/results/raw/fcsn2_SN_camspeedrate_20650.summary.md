# DART ablation summary

Sweep: camspeedrate = 20650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.08 (0.54) | 67.57 (18.80) | 5.07 (0.79) | 136 (98) | 2.00 (0.82) | 162.7 (117.0) | 18.9 (2.2) | 5.5 (2.0) | 1.32 (0.39) | 14% | 2.60 (0.76) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.09 (0.37) | 67.57 (15.89) | 4.89 (0.94) | 348 (88) | 5.01 (0.00) | 417.8 (107.8) | 19.1 (2.6) | 6.4 (2.4) | 1.36 (0.45) | 15% | 3.04 (0.90) |


