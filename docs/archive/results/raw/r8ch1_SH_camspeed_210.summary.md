# DART ablation summary

Sweep: camspeed = 210

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 33% [15, 58] | 0.69 (0.88) | 116.18 (31.29) | 3.81 (1.68) | 143 (84) | 1.63 (0.53) | 171.9 (100.3) | 20.7 (2.8) | 4.3 (0.7) | 1.72 (0.42) | 44% | 2.52 (0.80) |
| FR_SAFE_3 | 15 | 67% [42, 85] | 33% [15, 58] | 0.72 (0.66) | 101.55 (32.97) | 4.50 (1.33) | 274 (103) | 2.95 (0.00) | 329.0 (122.4) | 23.1 (2.2) | 5.1 (1.3) | 2.10 (0.40) | 52% | 2.44 (0.59) |


