# DART ablation summary

Sweep: camspeedrate = 21015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 73% [48, 89] | 0.08 (0.20) | 117.21 (29.85) | 3.85 (1.96) | 126 (100) | 1.32 (0.18) | 152.0 (120.7) | 22.6 (2.2) | 10.3 (3.3) | 2.04 (0.37) | 42% | 2.30 (0.86) |
| FR_SAFE | 15 | 33% [15, 58] | 60% [36, 80] | 0.24 (0.40) | 119.53 (33.33) | 4.74 (2.23) | 89 (82) | 1.53 (0.07) | 108.2 (99.0) | 24.0 (3.2) | 11.5 (3.4) | 2.25 (0.57) | 39% | 2.29 (1.00) |


