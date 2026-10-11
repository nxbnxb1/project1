# DART ablation summary

Sweep: camspeed = 215

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 47% [30, 64] | 37% [22, 54] | 0.72 (0.98) | 48.60 (16.87) | 6.43 (2.56) | 69 (31) | 1.54 (0.54) | 82.8 (37.6) | 20.7 (2.8) | 4.3 (1.5) | 1.55 (0.45) | 28% | 2.42 (0.85) |
| FR_SAFE_3 | 30 | 77% [59, 88] | 23% [12, 41] | 1.25 (1.28) | 57.21 (14.78) | 6.93 (1.51) | 145 (59) | 2.95 (0.01) | 173.6 (71.7) | 21.4 (1.7) | 4.5 (1.1) | 1.64 (0.31) | 30% | 2.61 (0.76) |


