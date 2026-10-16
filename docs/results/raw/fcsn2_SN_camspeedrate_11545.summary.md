# DART ablation summary

Sweep: camspeedrate = 11545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 20% [10, 37] | 1.19 (1.04) | 44.30 (17.08) | 7.80 (1.87) | 103 (72) | 2.53 (0.70) | 126.0 (88.2) | 23.8 (1.3) | 6.3 (2.1) | 2.07 (0.28) | 29% | 2.72 (1.03) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.18 (0.83) | 41.84 (10.78) | 8.04 (1.55) | 179 (53) | 4.36 (0.01) | 219.0 (65.3) | 24.0 (1.2) | 6.8 (2.3) | 2.09 (0.27) | 32% | 2.73 (1.06) |


