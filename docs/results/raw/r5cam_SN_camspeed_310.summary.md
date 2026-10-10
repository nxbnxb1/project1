# DART ablation summary

Sweep: camspeed = 310

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.66 (0.88) | 36.07 (3.35) | 8.39 (1.34) | 51 (38) | 1.72 (0.76) | 62.2 (46.1) | 21.8 (1.9) | 4.6 (2.1) | 1.59 (0.35) | 16% | 3.01 (1.76) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 0% [0, 20] | 1.78 (0.51) | 44.24 (10.01) | 7.47 (1.74) | 144 (60) | 2.95 (0.01) | 173.4 (70.0) | 22.4 (1.6) | 5.5 (1.9) | 1.76 (0.38) | 22% | 2.90 (1.09) |


