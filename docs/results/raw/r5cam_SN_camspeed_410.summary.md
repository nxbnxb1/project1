# DART ablation summary

Sweep: camspeed = 410

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 40% [20, 64] | 0.64 (1.08) | 47.44 (17.82) | 7.50 (1.63) | 46 (21) | 1.09 (0.36) | 218.0 (100.1) | 22.1 (1.6) | 5.1 (1.7) | 1.70 (0.34) | 23% | 2.86 (0.92) |
| FR_SAFE_3 | 15 | 100% [80, 100] | 0% [0, 20] | 1.48 (0.58) | 58.07 (36.03) | 7.12 (1.97) | 156 (97) | 2.69 (0.03) | 751.0 (461.8) | 22.5 (1.7) | 5.7 (2.3) | 1.79 (0.41) | 25% | 3.19 (0.93) |


