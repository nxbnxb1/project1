# DART ablation summary

Sweep: camspeedrate = 11505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 63% [46, 78] | 37% [22, 54] | 1.73 (2.18) | 23.71 (1.73) | 7.65 (2.02) | 10 (8) | 0.46 (0.04) | 12.8 (9.9) | 20.8 (2.3) | 3.4 (2.5) | 1.45 (0.53) | 16% | 4.10 (2.88) |
| FR_SAFE | 30 | 73% [56, 86] | 23% [12, 41] | 2.02 (1.96) | 25.82 (7.86) | 7.63 (1.98) | 13 (9) | 0.53 (0.04) | 16.1 (11.4) | 20.5 (1.9) | 3.0 (2.0) | 1.40 (0.46) | 15% | 3.81 (2.73) |


