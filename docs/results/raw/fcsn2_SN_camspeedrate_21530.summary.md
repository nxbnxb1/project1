# DART ablation summary

Sweep: camspeedrate = 21530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 70% [52, 83] | 27% [14, 44] | 0.97 (1.12) | 51.59 (19.07) | 6.73 (2.22) | 92 (67) | 1.95 (0.62) | 110.5 (80.0) | 22.6 (1.9) | 8.3 (3.0) | 1.85 (0.38) | 29% | 2.12 (0.67) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.16 (1.01) | 51.19 (17.57) | 6.79 (1.95) | 147 (60) | 2.96 (0.03) | 175.7 (72.5) | 22.4 (1.7) | 8.3 (2.9) | 1.82 (0.36) | 27% | 2.64 (0.99) |


