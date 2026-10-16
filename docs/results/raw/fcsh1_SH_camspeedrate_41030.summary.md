# DART ablation summary

Sweep: camspeedrate = 41030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.82 (0.40) | 74.48 (17.96) | 5.13 (0.82) | 140 (50) | 1.91 (0.28) | 673.4 (240.1) | 26.5 (0.6) | 16.3 (1.5) | 2.68 (0.12) | 50% | 2.04 (0.43) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.93 (0.43) | 70.27 (15.77) | 5.40 (0.85) | 186 (42) | 2.69 (0.02) | 893.0 (202.4) | 26.2 (0.8) | 16.5 (0.8) | 2.63 (0.13) | 48% | 2.03 (0.33) |


