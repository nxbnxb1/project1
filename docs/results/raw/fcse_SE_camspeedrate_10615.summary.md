# DART ablation summary

Sweep: camspeedrate = 10615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 7% [2, 21] | 1.91 (1.28) | 56.31 (41.20) | 4.66 (1.55) | 60 (90) | 0.70 (0.41) | 73.6 (111.0) | 18.3 (4.3) | 4.8 (3.5) | 1.26 (0.78) | 16% | 3.72 (3.03) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 2.27 (1.73) | 62.01 (49.41) | 4.48 (1.70) | 101 (74) | 1.50 (0.01) | 123.8 (90.7) | 19.0 (4.6) | 5.7 (4.0) | 1.37 (0.84) | 16% | 3.96 (2.60) |


