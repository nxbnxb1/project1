# DART ablation summary

Sweep: speedrate = 650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.15 (0.34) | 63.95 (12.97) | 5.24 (0.64) | 154 (88) | 2.28 (0.89) | 185.6 (106.6) | 18.8 (3.0) | 5.8 (2.7) | 1.28 (0.51) | 11% | 2.92 (0.96) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.03 (0.46) | 59.44 (6.85) | 5.44 (0.35) | 296 (34) | 5.01 (0.01) | 356.2 (41.5) | 18.6 (3.0) | 6.3 (2.8) | 1.24 (0.51) | 10% | 2.95 (0.95) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.08 (0.46) | 62.15 (13.63) | 5.27 (0.63) | 116 (60) | 1.80 (0.47) | 140.4 (72.8) | 18.5 (2.7) | 5.6 (2.7) | 1.23 (0.48) | 10% | 2.76 (0.90) |


