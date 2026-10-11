# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.13 (0.33) | 64.54 (13.24) | 5.17 (0.66) | 108 (42) | 1.63 (0.39) | 130.8 (51.0) | 19.6 (2.5) | 8.6 (2.7) | 1.42 (0.44) | 11% | 2.58 (0.75) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.09 (0.46) | 64.16 (14.06) | 5.23 (0.63) | 189 (41) | 2.95 (0.00) | 227.6 (51.4) | 19.7 (2.7) | 9.1 (3.2) | 1.45 (0.47) | 12% | 2.96 (0.96) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 0.84 (0.67) | 67.52 (14.82) | 5.06 (0.73) | 105 (42) | 1.58 (0.24) | 126.6 (50.1) | 19.6 (2.5) | 8.8 (3.1) | 1.44 (0.44) | 14% | 2.62 (0.71) |


