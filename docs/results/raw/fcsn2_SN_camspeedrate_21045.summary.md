# DART ablation summary

Sweep: camspeedrate = 21045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.21 (0.65) | 45.66 (8.65) | 7.36 (1.07) | 103 (43) | 2.28 (0.61) | 124.3 (51.9) | 22.7 (1.6) | 4.4 (1.5) | 1.84 (0.35) | 24% | 2.25 (0.60) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.24 (0.62) | 51.84 (19.84) | 6.93 (1.69) | 228 (86) | 4.36 (0.01) | 274.1 (104.0) | 22.8 (1.9) | 5.3 (1.8) | 1.87 (0.38) | 26% | 2.87 (1.13) |


