# DART ablation summary

Sweep: camspeedrate = 21015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 60% [36, 80] | 0.29 (0.53) | 100.55 (44.08) | 5.05 (2.02) | 79 (76) | 1.28 (0.18) | 94.3 (91.4) | 23.2 (1.8) | 5.3 (1.4) | 2.10 (0.31) | 39% | 2.19 (0.60) |
| FR_SAFE | 15 | 47% [25, 70] | 47% [25, 70] | 0.34 (0.64) | 106.98 (41.48) | 4.75 (1.87) | 105 (83) | 1.52 (0.04) | 125.6 (100.4) | 23.9 (1.7) | 6.2 (1.0) | 2.24 (0.24) | 42% | 2.20 (0.84) |


