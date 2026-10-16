# DART ablation summary

Sweep: camspeedrate = 40650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.22 (1.01) | 48.86 (22.03) | 4.97 (1.01) | 70 (78) | 1.15 (0.80) | 335.9 (372.3) | 19.2 (5.2) | 5.6 (4.3) | 1.40 (0.92) | 15% | 3.08 (2.54) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.53 (1.67) | 45.17 (15.00) | 5.02 (0.91) | 132 (44) | 2.91 (0.06) | 633.9 (209.0) | 19.5 (5.3) | 6.1 (4.4) | 1.45 (0.95) | 14% | 3.49 (2.42) |


