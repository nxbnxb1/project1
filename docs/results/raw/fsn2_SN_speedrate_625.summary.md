# DART ablation summary

Sweep: speedrate = 625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.10 (0.36) | 62.50 (12.04) | 5.34 (0.55) | 82 (34) | 1.30 (0.37) | 97.6 (39.8) | 18.3 (2.5) | 4.8 (2.1) | 1.18 (0.43) | 8% | 2.25 (0.66) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.03 (0.32) | 63.08 (16.08) | 5.29 (0.79) | 156 (40) | 2.51 (0.01) | 185.3 (46.1) | 18.4 (2.6) | 5.4 (2.4) | 1.22 (0.46) | 10% | 2.39 (0.68) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.06 (0.42) | 60.29 (8.37) | 5.35 (0.48) | 79 (22) | 1.32 (0.17) | 94.4 (25.8) | 18.1 (2.3) | 4.8 (2.0) | 1.16 (0.40) | 8% | 2.20 (0.66) |


