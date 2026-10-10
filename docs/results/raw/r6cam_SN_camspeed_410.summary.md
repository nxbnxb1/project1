# DART ablation summary

Sweep: camspeed = 410

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 0% [0, 20] | 2.52 (1.00) | 49.98 (19.00) | 7.55 (1.51) | 62 (32) | 1.19 (0.36) | 299.1 (155.2) | 21.4 (1.9) | 4.7 (1.5) | 1.60 (0.37) | 18% | 3.07 (0.88) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 1.48 (0.58) | 58.07 (36.03) | 7.12 (1.97) | 156 (97) | 2.69 (0.03) | 751.0 (461.8) | 22.5 (1.7) | 5.8 (2.3) | 1.79 (0.41) | 25% | 3.19 (0.93) |


