# DART ablation summary

Sweep: camspeedrate = 21005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 70% [52, 83] | 30% [17, 48] | 1.34 (1.68) | 25.75 (4.37) | 7.85 (1.49) | 11 (8) | 0.47 (0.04) | 13.6 (9.3) | 20.6 (2.0) | 4.7 (3.3) | 1.42 (0.46) | 17% | 3.52 (2.17) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 1.40 (1.24) | 31.63 (20.86) | 7.69 (1.77) | 15 (10) | 0.53 (0.02) | 17.7 (12.3) | 20.2 (1.7) | 4.7 (3.2) | 1.35 (0.40) | 16% | 3.52 (2.58) |


