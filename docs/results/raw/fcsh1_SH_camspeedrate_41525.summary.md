# DART ablation summary

Sweep: camspeedrate = 41525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.58 (0.45) | 77.94 (16.23) | 4.86 (1.10) | 141 (47) | 1.86 (0.21) | 682.5 (230.5) | 26.2 (0.8) | 15.7 (1.0) | 2.64 (0.16) | 51% | 2.21 (0.57) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.94 (0.40) | 72.71 (23.63) | 5.49 (1.22) | 169 (62) | 2.42 (0.02) | 815.6 (297.0) | 26.6 (0.8) | 16.5 (1.1) | 2.69 (0.15) | 51% | 2.05 (0.36) |


