# DART ablation summary

Sweep: camspeedrate = 21010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 43% [27, 61] | 53% [36, 70] | 0.40 (1.18) | 48.28 (19.78) | 7.27 (2.29) | 30 (28) | 0.83 (0.16) | 36.3 (33.6) | 22.1 (1.5) | 3.6 (1.4) | 1.73 (0.36) | 24% | 2.10 (0.62) |
| FR_SAFE | 30 | 50% [33, 67] | 50% [33, 67] | 0.44 (0.74) | 58.98 (35.40) | 7.39 (1.82) | 38 (34) | 1.03 (0.04) | 45.7 (41.7) | 22.0 (1.3) | 3.5 (1.3) | 1.72 (0.30) | 23% | 2.50 (1.13) |


