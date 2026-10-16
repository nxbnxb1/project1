# DART ablation summary

Sweep: camspeedrate = 10620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 3% [1, 17] | 2.13 (1.29) | 56.71 (35.79) | 4.54 (1.58) | 69 (80) | 0.90 (0.58) | 84.5 (98.1) | 18.5 (4.6) | 5.1 (3.9) | 1.29 (0.83) | 15% | 3.81 (2.76) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 2.37 (1.72) | 48.73 (29.72) | 4.67 (1.59) | 113 (85) | 2.01 (0.01) | 139.7 (104.4) | 18.6 (4.5) | 5.4 (3.8) | 1.30 (0.80) | 15% | 3.71 (2.71) |


