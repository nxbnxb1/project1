# DART ablation summary

Sweep: camspeedrate = 10635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.56 (0.43) | 112.41 (37.03) | 3.88 (0.74) | 211 (138) | 2.07 (0.65) | 258.8 (167.6) | 23.8 (1.4) | 12.7 (2.1) | 2.20 (0.25) | 32% | 2.21 (0.49) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.58 (0.46) | 103.22 (32.78) | 3.89 (0.97) | 306 (141) | 3.46 (0.02) | 374.7 (174.9) | 23.4 (2.4) | 13.6 (1.9) | 2.12 (0.40) | 30% | 2.25 (0.76) |


