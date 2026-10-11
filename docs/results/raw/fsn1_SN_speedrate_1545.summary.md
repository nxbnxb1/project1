# DART ablation summary

Sweep: speedrate = 1545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 85% [64, 95] | 15% [5, 36] | 1.14 (0.66) | 37.03 (8.05) | 8.72 (1.75) | 105 (42) | 2.70 (0.57) | 126.5 (51.0) | 25.0 (1.4) | 10.2 (3.9) | 2.32 (0.30) | 31% | 2.67 (0.82) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.25 (0.59) | 37.26 (10.74) | 8.96 (1.47) | 161 (46) | 4.36 (0.01) | 194.6 (55.6) | 24.8 (0.9) | 10.3 (3.4) | 2.26 (0.20) | 30% | 2.80 (1.17) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.12 (0.55) | 41.09 (13.10) | 8.72 (2.10) | 115 (42) | 2.93 (0.31) | 138.4 (50.7) | 24.6 (1.0) | 9.8 (4.0) | 2.24 (0.22) | 30% | 2.73 (1.06) |


