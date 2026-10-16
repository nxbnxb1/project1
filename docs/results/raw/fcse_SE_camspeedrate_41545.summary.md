# DART ablation summary

Sweep: camspeedrate = 41545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.56 (2.73) | 28.46 (12.71) | 8.36 (2.40) | 49 (37) | 1.52 (0.48) | 233.4 (178.0) | 23.3 (1.9) | 8.5 (5.7) | 2.03 (0.42) | 28% | 3.69 (2.80) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.91 (2.19) | 31.12 (16.82) | 8.15 (2.47) | 91 (48) | 2.92 (0.06) | 436.1 (234.8) | 23.2 (1.7) | 8.6 (5.6) | 2.00 (0.39) | 28% | 3.66 (2.63) |


