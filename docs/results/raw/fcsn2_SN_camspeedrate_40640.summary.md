# DART ablation summary

Sweep: camspeedrate = 40640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.06 (0.49) | 65.49 (12.70) | 5.17 (0.58) | 91 (48) | 1.33 (0.47) | 437.6 (230.6) | 19.2 (2.6) | 8.7 (3.5) | 1.37 (0.45) | 12% | 2.26 (0.64) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.04 (0.36) | 64.29 (10.43) | 5.23 (0.46) | 185 (31) | 2.90 (0.04) | 888.9 (146.1) | 19.2 (2.6) | 9.2 (3.4) | 1.36 (0.44) | 12% | 2.55 (0.84) |


