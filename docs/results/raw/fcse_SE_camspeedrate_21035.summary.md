# DART ablation summary

Sweep: camspeedrate = 21035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.55 (1.66) | 36.88 (29.23) | 7.04 (2.40) | 78 (103) | 1.54 (0.89) | 92.4 (121.5) | 21.9 (2.8) | 7.2 (5.5) | 1.70 (0.65) | 21% | 3.51 (2.43) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.44 (1.81) | 37.24 (29.46) | 6.91 (2.44) | 134 (100) | 3.46 (0.01) | 159.6 (117.5) | 22.0 (2.6) | 7.9 (5.4) | 1.76 (0.62) | 24% | 3.83 (2.46) |


