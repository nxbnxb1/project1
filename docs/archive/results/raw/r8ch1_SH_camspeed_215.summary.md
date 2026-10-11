# DART ablation summary

Sweep: camspeed = 215

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 27% [11, 52] | 0.46 (0.54) | 107.51 (45.51) | 4.31 (1.66) | 124 (78) | 1.63 (0.55) | 148.9 (93.2) | 19.4 (2.8) | 5.1 (1.3) | 1.49 (0.42) | 39% | 2.40 (0.84) |
| FR_SAFE_3 | 15 | 47% [25, 70] | 47% [25, 70] | 0.54 (0.62) | 104.53 (53.31) | 4.77 (1.28) | 222 (154) | 2.96 (0.02) | 267.5 (187.2) | 22.4 (2.4) | 6.6 (1.7) | 1.96 (0.41) | 49% | 2.57 (0.66) |


