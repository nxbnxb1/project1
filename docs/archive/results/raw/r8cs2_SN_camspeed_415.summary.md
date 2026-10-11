# DART ablation summary

Sweep: camspeed = 415

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 2.04 (1.58) | 48.70 (18.21) | 7.65 (2.20) | 71 (26) | 1.55 (0.33) | 340.9 (125.1) | 23.0 (1.9) | 5.4 (1.2) | 1.99 (0.29) | 30% | 2.74 (0.93) |
| FR_SAFE_3 | 30 | 97% [83, 99] | 3% [1, 17] | 1.68 (0.96) | 45.49 (15.17) | 7.99 (1.78) | 120 (44) | 2.70 (0.03) | 573.1 (208.3) | 24.3 (1.2) | 5.9 (1.3) | 2.19 (0.22) | 31% | 2.58 (0.68) |


