# DART ablation summary

Sweep: camspeedrate = 11515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 30% [17, 48] | 0.95 (1.11) | 58.33 (33.02) | 7.30 (2.76) | 59 (47) | 1.19 (0.20) | 71.7 (57.3) | 22.8 (2.2) | 5.3 (1.8) | 1.91 (0.36) | 29% | 2.48 (1.33) |
| FR_SAFE | 30 | 63% [46, 78] | 30% [17, 48] | 0.74 (1.11) | 45.55 (28.77) | 7.40 (3.07) | 68 (45) | 1.50 (0.01) | 83.8 (54.3) | 23.2 (2.0) | 5.5 (2.3) | 1.97 (0.35) | 29% | 2.40 (0.76) |


