# DART ablation summary

Sweep: camspeedrate = 10605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 70% [52, 83] | 30% [17, 48] | 1.24 (1.18) | 39.78 (9.19) | 4.49 (1.56) | 19 (14) | 0.36 (0.10) | 22.8 (16.6) | 18.5 (4.8) | 4.4 (3.8) | 1.29 (0.86) | 20% | 3.41 (2.49) |
| FR_SAFE | 30 | 73% [56, 86] | 27% [14, 44] | 1.87 (1.82) | 41.71 (18.28) | 4.64 (1.49) | 28 (20) | 0.51 (0.01) | 34.6 (24.8) | 18.1 (4.5) | 4.0 (3.1) | 1.22 (0.82) | 16% | 3.97 (2.93) |


