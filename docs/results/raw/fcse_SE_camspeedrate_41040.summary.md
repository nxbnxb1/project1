# DART ablation summary

Sweep: camspeedrate = 41040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.89 (1.75) | 35.10 (18.13) | 7.24 (2.03) | 58 (55) | 1.35 (0.66) | 277.6 (266.4) | 22.2 (3.0) | 8.2 (5.7) | 1.77 (0.68) | 25% | 3.39 (2.71) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.27 (2.00) | 31.01 (12.56) | 7.57 (1.64) | 90 (36) | 2.91 (0.06) | 433.2 (174.2) | 22.0 (2.6) | 8.3 (5.3) | 1.74 (0.61) | 23% | 3.73 (2.69) |


