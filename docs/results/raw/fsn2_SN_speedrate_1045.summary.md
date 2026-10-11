# DART ablation summary

Sweep: speedrate = 1045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.34 (0.53) | 40.61 (7.91) | 8.01 (1.01) | 94 (33) | 2.28 (0.54) | 112.5 (38.1) | 22.8 (1.5) | 6.4 (2.4) | 1.82 (0.34) | 19% | 2.34 (0.76) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.19 (0.45) | 46.67 (20.01) | 7.54 (1.60) | 203 (87) | 4.36 (0.01) | 242.5 (105.2) | 23.1 (1.8) | 7.0 (2.9) | 1.90 (0.42) | 27% | 2.59 (0.88) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 0.95 (0.46) | 41.36 (7.96) | 7.75 (1.13) | 92 (31) | 2.20 (0.48) | 109.4 (36.1) | 23.1 (1.9) | 6.7 (2.9) | 1.89 (0.43) | 24% | 2.47 (0.85) |


