# DART ablation summary

Sweep: camspeedrate = 21005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 23% [12, 41] | 73% [56, 86] | 0.10 (0.33) | 36.84 (7.47) | 7.94 (2.17) | 12 (11) | 0.52 (0.06) | 15.2 (13.8) | 20.8 (1.5) | 4.4 (1.5) | 1.44 (0.27) | 15% | 2.72 (1.78) |
| FR_SAFE | 30 | 23% [12, 41] | 77% [59, 88] | 0.11 (0.37) | 41.17 (14.11) | 8.54 (1.24) | 11 (8) | 0.55 (0.06) | 12.8 (9.8) | 21.0 (1.3) | 4.2 (1.5) | 1.44 (0.25) | 12% | 2.62 (1.61) |


