# DART ablation summary

Sweep: camspeedrate = 11505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 43% [27, 61] | 57% [39, 73] | 0.29 (0.63) | 43.68 (15.27) | 7.94 (2.07) | 17 (11) | 0.48 (0.04) | 20.9 (13.3) | 21.6 (1.7) | 5.1 (2.0) | 1.59 (0.34) | 21% | 2.62 (1.16) |
| FR_SAFE | 30 | 33% [19, 51] | 63% [46, 78] | 0.28 (0.76) | 44.70 (21.04) | 7.79 (2.57) | 17 (11) | 0.53 (0.05) | 21.2 (12.5) | 21.3 (1.8) | 5.2 (3.1) | 1.52 (0.42) | 20% | 2.68 (1.62) |


