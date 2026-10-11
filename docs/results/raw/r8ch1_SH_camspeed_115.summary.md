# DART ablation summary

Sweep: camspeed = 115

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 27% [11, 52] | 0.50 (0.57) | 85.40 (34.75) | 4.88 (1.88) | 125 (59) | 1.79 (0.57) | 151.6 (71.1) | 21.8 (2.9) | 6.2 (1.4) | 1.87 (0.43) | 48% | 2.50 (0.67) |
| FR_SAFE_3 | 15 | 40% [20, 64] | 47% [25, 70] | 0.58 (0.73) | 90.54 (28.53) | 5.12 (1.98) | 200 (116) | 2.98 (0.08) | 243.7 (141.4) | 22.5 (2.7) | 6.8 (2.0) | 1.99 (0.45) | 50% | 2.63 (1.31) |


