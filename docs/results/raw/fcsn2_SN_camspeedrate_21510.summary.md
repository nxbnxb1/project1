# DART ablation summary

Sweep: camspeedrate = 21510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 43% [27, 61] | 53% [36, 70] | 0.49 (1.33) | 52.46 (23.97) | 7.35 (2.29) | 29 (23) | 0.83 (0.15) | 34.9 (28.2) | 21.9 (1.7) | 5.9 (2.1) | 1.69 (0.35) | 22% | 2.18 (1.08) |
| FR_SAFE | 30 | 47% [30, 64] | 53% [36, 70] | 0.35 (0.90) | 42.28 (10.19) | 7.27 (1.87) | 35 (20) | 1.03 (0.04) | 42.0 (23.8) | 22.0 (1.3) | 5.9 (2.0) | 1.70 (0.30) | 24% | 2.17 (1.24) |


