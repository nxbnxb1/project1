# DART ablation summary

Sweep: camspeedrate = 40615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.39 (0.58) | 69.86 (18.49) | 4.99 (0.76) | 61 (31) | 0.85 (0.24) | 293.6 (149.9) | 19.6 (2.7) | 6.1 (2.5) | 1.43 (0.48) | 14% | 2.08 (0.53) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.10 (0.41) | 67.32 (17.31) | 4.99 (0.79) | 102 (31) | 1.50 (0.00) | 486.6 (149.8) | 19.6 (2.9) | 6.2 (2.6) | 1.45 (0.52) | 15% | 2.47 (0.72) |


