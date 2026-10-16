# DART ablation summary

Sweep: camspeedrate = 21535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 47% [25, 70] | 0.36 (0.60) | 95.65 (28.30) | 4.85 (1.62) | 162 (119) | 2.50 (0.51) | 194.6 (142.4) | 24.8 (1.7) | 9.4 (1.3) | 2.38 (0.26) | 46% | 2.13 (0.59) |
| FR_SAFE | 15 | 40% [20, 64] | 60% [36, 80] | 0.27 (0.39) | 90.27 (24.13) | 5.17 (1.56) | 188 (121) | 3.47 (0.03) | 227.4 (146.6) | 25.2 (1.7) | 10.1 (1.7) | 2.45 (0.29) | 47% | 2.07 (0.48) |


