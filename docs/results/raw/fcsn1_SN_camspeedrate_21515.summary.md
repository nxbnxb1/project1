# DART ablation summary

Sweep: camspeedrate = 21515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 23% [12, 41] | 0.76 (0.78) | 52.04 (30.69) | 7.36 (2.03) | 49 (43) | 1.02 (0.20) | 59.0 (51.8) | 21.9 (1.3) | 6.5 (2.5) | 1.68 (0.31) | 24% | 2.58 (1.20) |
| FR_SAFE | 30 | 67% [49, 81] | 33% [19, 51] | 0.73 (0.68) | 44.20 (12.36) | 7.50 (2.26) | 64 (39) | 1.51 (0.01) | 77.2 (45.9) | 22.4 (1.7) | 7.0 (3.4) | 1.75 (0.40) | 24% | 2.81 (1.22) |


