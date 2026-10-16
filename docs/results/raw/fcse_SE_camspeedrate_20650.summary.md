# DART ablation summary

Sweep: camspeedrate = 20650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 2.27 (1.28) | 49.60 (23.27) | 4.83 (1.21) | 112 (131) | 1.70 (1.34) | 134.3 (157.7) | 18.8 (4.6) | 7.4 (5.4) | 1.34 (0.83) | 14% | 3.92 (2.54) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.07 (1.24) | 44.97 (25.17) | 5.10 (1.04) | 229 (124) | 5.01 (0.01) | 275.2 (149.8) | 19.3 (4.8) | 8.5 (5.7) | 1.40 (0.84) | 13% | 4.02 (2.55) |


