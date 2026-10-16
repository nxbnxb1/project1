# DART ablation summary

Sweep: camspeedrate = 41010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.40 (2.34) | 43.23 (31.48) | 6.94 (2.56) | 34 (32) | 0.71 (0.14) | 164.1 (153.8) | 22.2 (3.2) | 7.8 (5.7) | 1.78 (0.72) | 28% | 3.38 (2.64) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 3.14 (2.55) | 35.16 (21.29) | 7.08 (2.33) | 38 (23) | 1.02 (0.01) | 181.2 (110.3) | 22.3 (3.1) | 7.8 (5.7) | 1.79 (0.70) | 26% | 3.40 (2.62) |


