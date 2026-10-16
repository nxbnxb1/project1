# DART ablation summary

Sweep: camspeedrate = 10610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 0.94 (0.75) | 81.85 (27.86) | 4.28 (1.17) | 56 (31) | 0.66 (0.17) | 68.5 (37.5) | 19.1 (2.9) | 7.1 (3.3) | 1.38 (0.51) | 23% | 2.27 (0.74) |
| FR_SAFE | 30 | 73% [56, 86] | 17% [7, 34] | 1.22 (0.75) | 72.15 (18.53) | 4.42 (1.27) | 77 (30) | 1.01 (0.01) | 93.7 (36.6) | 18.7 (2.8) | 7.0 (3.2) | 1.32 (0.50) | 19% | 2.53 (0.60) |


