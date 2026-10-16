# DART ablation summary

Sweep: camspeedrate = 20650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.19 (0.47) | 74.33 (25.25) | 4.70 (1.11) | 175 (131) | 2.14 (0.94) | 208.4 (156.3) | 18.7 (2.7) | 5.8 (2.5) | 1.30 (0.48) | 15% | 3.06 (0.92) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.15 (0.37) | 67.83 (23.25) | 5.15 (0.85) | 339 (117) | 5.01 (0.00) | 406.5 (142.8) | 18.6 (2.6) | 6.0 (2.5) | 1.26 (0.45) | 14% | 3.22 (1.00) |


