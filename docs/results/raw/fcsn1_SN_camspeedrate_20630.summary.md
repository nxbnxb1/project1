# DART ablation summary

Sweep: camspeedrate = 20630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 17% [7, 34] | 0.88 (0.62) | 81.26 (32.48) | 4.69 (1.03) | 118 (93) | 1.38 (0.51) | 141.8 (112.5) | 18.7 (2.6) | 7.2 (3.3) | 1.30 (0.47) | 17% | 2.62 (0.84) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 0.99 (0.66) | 72.01 (23.51) | 4.98 (0.92) | 195 (73) | 2.95 (0.01) | 233.2 (86.6) | 19.0 (2.8) | 7.8 (3.7) | 1.32 (0.50) | 16% | 3.02 (1.03) |


