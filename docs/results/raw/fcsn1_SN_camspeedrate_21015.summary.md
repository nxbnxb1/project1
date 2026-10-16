# DART ablation summary

Sweep: camspeedrate = 21015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 67% [49, 81] | 30% [17, 48] | 0.96 (0.84) | 50.65 (25.01) | 6.89 (2.26) | 50 (35) | 1.02 (0.22) | 60.2 (41.6) | 22.1 (1.8) | 4.0 (1.8) | 1.74 (0.40) | 24% | 2.44 (0.81) |
| FR_SAFE | 30 | 63% [46, 78] | 30% [17, 48] | 0.84 (0.88) | 51.41 (24.73) | 7.01 (2.14) | 67 (43) | 1.51 (0.01) | 79.9 (50.7) | 21.9 (1.6) | 3.9 (1.5) | 1.71 (0.35) | 24% | 2.86 (1.50) |


