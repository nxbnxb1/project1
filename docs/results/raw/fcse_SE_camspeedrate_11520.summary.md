# DART ablation summary

Sweep: camspeedrate = 11520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.47 (1.87) | 32.75 (19.89) | 7.89 (2.52) | 42 (38) | 1.14 (0.37) | 51.4 (47.7) | 22.4 (2.0) | 4.8 (3.5) | 1.82 (0.47) | 24% | 3.91 (2.86) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 2.20 (1.88) | 36.94 (33.12) | 7.65 (2.93) | 74 (63) | 2.02 (0.03) | 91.0 (77.9) | 22.4 (2.0) | 5.3 (3.9) | 1.82 (0.47) | 25% | 3.92 (2.91) |


