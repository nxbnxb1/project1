# DART ablation summary

Sweep: camspeedrate = 41535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.75 (0.51) | 71.00 (28.75) | 5.42 (1.13) | 136 (87) | 2.09 (0.33) | 653.6 (418.0) | 26.5 (0.9) | 16.0 (1.3) | 2.69 (0.16) | 51% | 2.00 (0.43) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.97 (0.33) | 74.19 (16.32) | 5.28 (0.95) | 210 (46) | 2.84 (0.03) | 1012.6 (223.5) | 26.7 (0.7) | 16.6 (1.2) | 2.72 (0.15) | 51% | 2.20 (0.33) |


