# DART ablation summary

Sweep: camspeedrate = 41505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 63% [46, 78] | 37% [22, 54] | 0.83 (1.13) | 54.78 (23.23) | 6.72 (1.93) | 21 (11) | 0.48 (0.05) | 102.3 (55.4) | 22.5 (1.9) | 4.2 (2.1) | 1.82 (0.44) | 25% | 2.15 (0.77) |
| FR_SAFE | 30 | 67% [49, 81] | 33% [19, 51] | 0.71 (0.77) | 53.29 (18.59) | 6.86 (1.44) | 22 (12) | 0.53 (0.04) | 102.9 (57.7) | 22.1 (1.8) | 4.0 (1.6) | 1.73 (0.39) | 22% | 2.33 (0.68) |


