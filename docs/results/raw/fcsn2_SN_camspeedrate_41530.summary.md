# DART ablation summary

Sweep: camspeedrate = 41530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.60 (1.74) | 41.58 (14.82) | 8.45 (1.75) | 75 (39) | 1.74 (0.28) | 360.2 (191.1) | 24.6 (1.3) | 9.5 (3.1) | 2.24 (0.26) | 34% | 2.64 (1.24) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.49 (1.16) | 41.23 (10.63) | 8.29 (1.70) | 109 (30) | 2.70 (0.04) | 523.0 (144.8) | 24.9 (1.1) | 10.4 (3.4) | 2.30 (0.23) | 37% | 2.38 (0.78) |


