# DART ablation summary

Sweep: camspeedrate = 41545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.51 (0.84) | 40.71 (9.67) | 8.37 (1.57) | 78 (28) | 1.86 (0.28) | 371.2 (133.3) | 24.9 (1.1) | 9.8 (3.1) | 2.30 (0.25) | 34% | 2.43 (0.76) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.40 (0.73) | 40.94 (14.21) | 8.48 (1.80) | 118 (41) | 2.93 (0.06) | 564.5 (201.2) | 25.1 (1.1) | 10.0 (3.1) | 2.33 (0.25) | 36% | 2.59 (0.76) |


