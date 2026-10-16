# DART ablation summary

Sweep: camspeedrate = 41525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 3.18 (2.56) | 29.00 (14.33) | 8.28 (2.39) | 43 (34) | 1.35 (0.38) | 206.0 (163.1) | 23.3 (2.0) | 8.4 (5.5) | 2.02 (0.44) | 28% | 3.68 (2.74) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.45 (2.58) | 30.24 (15.70) | 8.15 (2.49) | 74 (38) | 2.44 (0.02) | 354.5 (183.9) | 23.5 (2.2) | 8.6 (6.0) | 2.06 (0.47) | 30% | 3.51 (2.69) |


