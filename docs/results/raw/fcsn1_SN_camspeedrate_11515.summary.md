# DART ablation summary

Sweep: camspeedrate = 11515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 23% [12, 41] | 0.83 (0.94) | 57.84 (34.60) | 7.15 (2.60) | 63 (48) | 1.16 (0.19) | 76.5 (59.3) | 23.2 (1.6) | 7.4 (3.2) | 1.99 (0.32) | 32% | 2.67 (1.22) |
| FR_SAFE | 30 | 70% [52, 83] | 30% [17, 48] | 0.97 (0.96) | 45.62 (23.96) | 7.83 (1.96) | 63 (35) | 1.51 (0.01) | 77.0 (42.6) | 23.2 (1.2) | 7.1 (2.6) | 1.96 (0.23) | 29% | 2.50 (1.03) |


