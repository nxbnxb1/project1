# DART ablation summary

Sweep: camspeedrate = 40605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 13% [5, 30] | 1.03 (0.77) | 88.89 (41.18) | 4.34 (1.29) | 37 (20) | 0.40 (0.06) | 173.9 (95.9) | 20.6 (3.5) | 9.2 (4.3) | 1.63 (0.64) | 26% | 2.06 (0.62) |
| FR_SAFE | 30 | 80% [63, 90] | 13% [5, 30] | 1.17 (0.94) | 81.96 (31.98) | 4.35 (1.16) | 42 (17) | 0.51 (0.01) | 202.1 (82.8) | 20.0 (2.9) | 8.4 (3.4) | 1.52 (0.53) | 20% | 2.06 (0.70) |


