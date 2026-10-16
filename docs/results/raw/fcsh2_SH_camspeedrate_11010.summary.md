# DART ablation summary

Sweep: camspeedrate = 11010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 60% [36, 80] | 0.23 (0.40) | 135.40 (32.62) | 3.87 (2.02) | 73 (48) | 0.90 (0.08) | 89.5 (59.3) | 22.9 (1.8) | 10.2 (2.5) | 2.09 (0.30) | 45% | 2.16 (0.59) |
| FR_SAFE | 15 | 33% [15, 58] | 60% [36, 80] | 0.28 (0.46) | 93.84 (21.73) | 4.57 (1.91) | 60 (44) | 1.02 (0.02) | 73.5 (53.2) | 23.4 (2.6) | 10.3 (2.0) | 2.14 (0.42) | 42% | 2.08 (0.95) |


