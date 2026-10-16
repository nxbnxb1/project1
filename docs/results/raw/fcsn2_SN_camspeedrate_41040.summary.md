# DART ablation summary

Sweep: camspeedrate = 41040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.28 (0.63) | 45.56 (10.95) | 7.50 (1.23) | 77 (35) | 1.66 (0.42) | 368.5 (170.0) | 23.4 (1.6) | 9.3 (3.2) | 1.96 (0.37) | 27% | 2.35 (0.68) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.41 (0.58) | 46.21 (13.37) | 7.47 (1.34) | 134 (38) | 2.91 (0.06) | 643.9 (186.8) | 23.2 (1.6) | 9.7 (3.3) | 1.92 (0.36) | 27% | 2.80 (0.93) |


