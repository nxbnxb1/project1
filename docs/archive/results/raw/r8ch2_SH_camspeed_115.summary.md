# DART ablation summary

Sweep: camspeed = 115

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 33% [15, 58] | 40% [20, 64] | 0.54 (0.64) | 111.18 (42.03) | 4.62 (2.39) | 118 (84) | 1.69 (0.57) | 144.2 (102.9) | 21.2 (2.1) | 5.9 (1.5) | 1.78 (0.33) | 44% | 2.28 (0.77) |
| FR_SAFE_3 | 15 | 73% [48, 89] | 13% [4, 38] | 0.68 (0.60) | 89.95 (58.23) | 5.08 (1.72) | 289 (211) | 2.95 (0.01) | 353.2 (259.0) | 23.0 (1.5) | 6.9 (1.5) | 2.07 (0.26) | 49% | 2.43 (0.46) |


