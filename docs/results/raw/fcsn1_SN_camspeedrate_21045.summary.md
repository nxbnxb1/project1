# DART ablation summary

Sweep: camspeedrate = 21045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.29 (0.83) | 45.63 (13.55) | 7.48 (1.65) | 106 (69) | 2.19 (0.68) | 127.3 (82.0) | 22.6 (1.4) | 5.0 (1.9) | 1.80 (0.33) | 23% | 2.65 (0.74) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.37 (0.66) | 50.24 (18.34) | 7.18 (1.67) | 219 (80) | 4.36 (0.01) | 262.3 (94.4) | 22.8 (1.6) | 5.5 (2.1) | 1.85 (0.38) | 26% | 3.04 (0.94) |


