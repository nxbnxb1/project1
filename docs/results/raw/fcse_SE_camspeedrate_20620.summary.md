# DART ablation summary

Sweep: camspeedrate = 20620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.80 (1.23) | 53.65 (42.63) | 4.58 (1.53) | 70 (94) | 0.86 (0.58) | 84.1 (113.1) | 19.0 (5.1) | 3.9 (3.2) | 1.38 (0.92) | 18% | 3.47 (2.38) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.07 (1.41) | 52.78 (30.43) | 4.68 (1.50) | 123 (92) | 2.01 (0.01) | 147.3 (108.1) | 19.0 (4.6) | 4.2 (2.9) | 1.37 (0.81) | 15% | 3.88 (2.51) |


