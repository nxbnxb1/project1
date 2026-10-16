# DART ablation summary

Sweep: camspeedrate = 41045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.47 (0.51) | 45.18 (12.52) | 7.70 (1.21) | 74 (39) | 1.56 (0.40) | 356.9 (184.5) | 23.1 (1.6) | 4.9 (2.0) | 1.88 (0.38) | 24% | 2.53 (0.67) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.37 (0.49) | 45.28 (11.32) | 7.64 (1.23) | 131 (33) | 2.90 (0.04) | 634.3 (157.9) | 23.3 (1.8) | 5.5 (2.3) | 1.94 (0.41) | 27% | 2.74 (0.92) |


