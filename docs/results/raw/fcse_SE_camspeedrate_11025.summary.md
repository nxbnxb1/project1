# DART ablation summary

Sweep: camspeedrate = 11025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.66 (1.45) | 39.50 (30.06) | 7.14 (2.47) | 59 (72) | 1.17 (0.60) | 72.5 (90.5) | 21.6 (2.4) | 5.0 (3.7) | 1.66 (0.58) | 22% | 4.00 (2.76) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.72 (1.82) | 38.28 (27.69) | 7.12 (2.45) | 95 (69) | 2.52 (0.01) | 116.4 (83.6) | 21.8 (2.7) | 5.7 (4.0) | 1.70 (0.63) | 25% | 4.05 (2.74) |


