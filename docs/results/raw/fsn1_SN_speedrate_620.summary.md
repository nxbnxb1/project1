# DART ablation summary

Sweep: speedrate = 620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.15 (0.45) | 65.36 (11.56) | 5.06 (0.61) | 79 (34) | 1.16 (0.33) | 95.3 (40.0) | 19.2 (2.9) | 4.7 (2.1) | 1.37 (0.52) | 12% | 2.92 (0.83) |
| FR_SAFE | 20 | 90% [70, 97] | 0% [0, 16] | 1.22 (0.30) | 61.75 (9.56) | 5.08 (0.95) | 134 (36) | 2.01 (0.01) | 161.2 (42.9) | 19.0 (3.0) | 4.7 (2.1) | 1.32 (0.53) | 12% | 3.05 (1.11) |
| E_DART | 20 | 95% [76, 99] | 0% [0, 16] | 1.18 (0.42) | 63.56 (11.49) | 5.07 (0.79) | 86 (30) | 1.28 (0.16) | 104.2 (36.1) | 19.1 (3.1) | 4.5 (2.2) | 1.34 (0.55) | 14% | 2.60 (0.78) |


