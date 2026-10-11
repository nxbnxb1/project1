# DART ablation summary

Sweep: camspeed = 410

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.94 (1.51) | 52.15 (19.21) | 7.24 (1.58) | 74 (29) | 1.43 (0.32) | 353.9 (141.7) | 22.4 (1.9) | 5.4 (1.4) | 1.81 (0.36) | 25% | 2.84 (1.06) |
| FR_SAFE_3 | 30 | 100% [89, 100] | 0% [0, 11] | 1.93 (1.54) | 51.07 (15.37) | 7.23 (1.31) | 138 (41) | 2.69 (0.03) | 659.6 (199.0) | 22.6 (1.3) | 5.7 (1.4) | 1.82 (0.30) | 26% | 2.91 (0.85) |


