# DART ablation summary

Sweep: camspeedrate = 11030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 2.76 (1.72) | 36.62 (30.61) | 7.09 (2.49) | 77 (116) | 1.33 (0.74) | 94.1 (143.6) | 21.9 (2.8) | 7.6 (5.9) | 1.71 (0.67) | 22% | 3.93 (2.67) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.71 (1.73) | 31.40 (15.15) | 7.35 (2.13) | 90 (49) | 2.97 (0.03) | 111.4 (59.7) | 21.6 (2.4) | 7.8 (5.1) | 1.66 (0.57) | 23% | 4.02 (2.65) |


