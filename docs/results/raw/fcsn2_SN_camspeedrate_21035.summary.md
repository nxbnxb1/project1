# DART ablation summary

Sweep: camspeedrate = 21035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 23% [12, 41] | 1.14 (1.40) | 56.31 (22.76) | 6.53 (2.09) | 122 (94) | 2.13 (0.71) | 147.3 (113.0) | 22.0 (1.7) | 8.4 (2.8) | 1.76 (0.33) | 26% | 2.40 (0.72) |
| FR_SAFE | 30 | 83% [66, 93] | 13% [5, 30] | 1.38 (1.33) | 52.74 (21.64) | 6.85 (1.80) | 166 (89) | 3.47 (0.02) | 199.0 (108.8) | 22.6 (1.4) | 8.8 (3.1) | 1.85 (0.32) | 28% | 2.59 (1.28) |


