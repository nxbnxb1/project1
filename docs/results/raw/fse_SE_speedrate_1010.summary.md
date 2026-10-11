# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.58 (1.88) | 42.86 (34.26) | 6.88 (2.53) | 35 (34) | 0.76 (0.14) | 41.3 (40.3) | 22.5 (3.3) | 8.5 (6.1) | 1.84 (0.74) | 29% | 3.33 (2.44) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.58 (2.03) | 43.52 (35.66) | 6.88 (2.52) | 43 (36) | 1.02 (0.01) | 51.5 (42.1) | 22.4 (3.4) | 8.3 (6.0) | 1.82 (0.74) | 28% | 3.30 (2.48) |
| E_DART | 30 | 100% [89, 100] | 0% [0, 11] | 2.91 (1.70) | 38.51 (25.96) | 6.92 (2.26) | 39 (26) | 1.01 (0.01) | 46.4 (30.3) | 22.4 (3.2) | 8.3 (5.8) | 1.82 (0.72) | 29% | 3.39 (2.51) |


