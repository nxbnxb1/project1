# DART ablation summary

Sweep: camspeedrate = 10605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 63% [46, 78] | 27% [14, 44] | 0.86 (0.75) | 75.46 (22.86) | 4.43 (1.32) | 29 (17) | 0.40 (0.08) | 35.4 (20.7) | 17.8 (1.9) | 3.8 (1.3) | 1.16 (0.34) | 19% | 2.30 (0.84) |
| FR_SAFE | 30 | 53% [36, 70] | 43% [27, 61] | 0.74 (0.88) | 85.28 (33.90) | 4.49 (1.23) | 37 (21) | 0.51 (0.01) | 45.0 (25.9) | 17.4 (2.3) | 4.0 (1.7) | 1.09 (0.42) | 16% | 2.66 (2.07) |


