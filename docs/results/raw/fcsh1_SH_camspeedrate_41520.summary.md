# DART ablation summary

Sweep: camspeedrate = 41520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 27% [11, 52] | 0.47 (0.48) | 73.76 (14.31) | 5.05 (0.87) | 106 (49) | 1.54 (0.22) | 512.3 (238.8) | 26.0 (1.2) | 8.6 (0.8) | 2.59 (0.21) | 50% | 2.11 (0.49) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.87 (0.35) | 79.27 (21.41) | 5.28 (1.18) | 152 (49) | 2.00 (0.01) | 729.7 (232.8) | 26.6 (0.9) | 8.8 (0.8) | 2.70 (0.19) | 53% | 2.08 (0.39) |


