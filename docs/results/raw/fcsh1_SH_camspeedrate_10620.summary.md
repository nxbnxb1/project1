# DART ablation summary

Sweep: camspeedrate = 10620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.43 (0.42) | 136.28 (33.02) | 3.19 (0.49) | 162 (109) | 1.46 (0.26) | 198.7 (137.4) | 23.6 (1.7) | 7.5 (0.9) | 2.21 (0.30) | 44% | 2.35 (0.46) |
| FR_SAFE | 15 | 60% [36, 80] | 33% [15, 58] | 0.42 (0.40) | 146.33 (51.44) | 3.13 (0.85) | 238 (128) | 2.01 (0.01) | 289.8 (156.6) | 23.7 (1.6) | 8.4 (1.0) | 2.21 (0.25) | 38% | 2.33 (0.64) |


