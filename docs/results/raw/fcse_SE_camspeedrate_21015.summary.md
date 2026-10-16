# DART ablation summary

Sweep: camspeedrate = 21015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 2.29 (1.99) | 30.36 (19.65) | 7.24 (2.11) | 28 (28) | 0.88 (0.34) | 33.6 (32.4) | 21.8 (2.8) | 6.6 (4.9) | 1.69 (0.64) | 21% | 3.61 (2.56) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 1.96 (1.61) | 31.23 (15.36) | 7.11 (2.18) | 52 (32) | 1.51 (0.01) | 62.2 (37.6) | 21.8 (2.6) | 6.7 (4.9) | 1.70 (0.62) | 24% | 3.62 (2.71) |


