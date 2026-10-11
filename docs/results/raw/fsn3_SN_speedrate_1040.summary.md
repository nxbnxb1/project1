# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.25 (0.69) | 42.17 (7.43) | 7.69 (1.08) | 100 (36) | 2.38 (0.51) | 120.5 (42.7) | 23.5 (1.6) | 7.4 (2.1) | 1.98 (0.36) | 25% | 2.90 (1.04) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.27 (0.92) | 44.20 (12.42) | 7.61 (1.34) | 177 (50) | 4.01 (0.01) | 213.8 (59.5) | 23.4 (1.6) | 7.6 (2.3) | 1.97 (0.35) | 26% | 2.53 (1.08) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.22 (0.76) | 46.02 (14.15) | 7.40 (1.45) | 106 (45) | 2.24 (0.36) | 128.3 (54.1) | 23.7 (1.4) | 7.6 (2.4) | 2.02 (0.33) | 29% | 2.57 (0.92) |


