# DART ablation summary

Sweep: camspeed = 406

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 0% [0, 11] | 1.51 (0.71) | 76.53 (20.20) | 4.53 (1.29) | 92 (48) | 1.08 (0.36) | 439.1 (234.3) | 18.2 (2.4) | 4.5 (1.5) | 1.23 (0.41) | 14% | 2.61 (0.76) |
| FR_SAFE_3 | 30 | 100% [89, 100] | 0% [0, 11] | 1.57 (0.67) | 72.38 (19.62) | 5.05 (0.66) | 195 (53) | 2.69 (0.03) | 934.9 (253.5) | 19.0 (2.3) | 4.9 (1.4) | 1.33 (0.40) | 14% | 3.07 (1.07) |


