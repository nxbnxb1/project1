# DART ablation summary

Sweep: camspeedrate = 10615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 17% [7, 34] | 1.07 (0.87) | 73.18 (25.61) | 4.72 (1.19) | 64 (51) | 0.82 (0.26) | 77.6 (61.2) | 18.5 (2.8) | 3.7 (1.8) | 1.26 (0.50) | 17% | 2.64 (1.55) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 1.04 (0.95) | 77.96 (35.38) | 4.61 (1.10) | 117 (54) | 1.50 (0.01) | 143.5 (64.5) | 19.0 (2.8) | 4.0 (1.9) | 1.35 (0.52) | 19% | 2.57 (0.77) |


