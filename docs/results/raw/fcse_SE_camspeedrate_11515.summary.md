# DART ablation summary

Sweep: camspeedrate = 11515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 2.34 (1.94) | 27.84 (20.56) | 7.73 (2.95) | 35 (36) | 0.97 (0.28) | 42.7 (43.0) | 22.2 (2.0) | 6.3 (4.9) | 1.78 (0.47) | 21% | 3.88 (2.62) |
| FR_SAFE | 30 | 73% [56, 86] | 20% [10, 37] | 2.28 (1.71) | 24.55 (10.82) | 7.64 (3.07) | 50 (41) | 1.52 (0.02) | 60.9 (49.3) | 21.9 (1.8) | 6.2 (4.6) | 1.74 (0.41) | 27% | 4.10 (2.76) |


