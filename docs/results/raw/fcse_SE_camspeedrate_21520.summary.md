# DART ablation summary

Sweep: camspeedrate = 21520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 17% [7, 34] | 2.15 (1.70) | 30.79 (17.90) | 7.21 (2.45) | 44 (55) | 1.07 (0.50) | 52.4 (65.9) | 21.6 (2.6) | 6.7 (5.1) | 1.65 (0.61) | 22% | 3.47 (2.61) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 2.30 (1.94) | 37.27 (45.27) | 7.17 (2.41) | 78 (91) | 2.02 (0.02) | 93.6 (110.2) | 21.6 (2.6) | 7.1 (5.3) | 1.64 (0.61) | 24% | 3.73 (2.35) |


