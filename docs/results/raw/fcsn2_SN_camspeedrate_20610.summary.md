# DART ablation summary

Sweep: camspeedrate = 20610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 13% [5, 30] | 1.01 (0.68) | 81.83 (24.55) | 4.18 (1.23) | 56 (26) | 0.66 (0.18) | 67.6 (31.3) | 19.1 (2.6) | 7.0 (2.8) | 1.40 (0.48) | 22% | 2.25 (0.81) |
| FR_SAFE | 30 | 73% [56, 86] | 13% [5, 30] | 1.03 (0.68) | 82.30 (28.78) | 4.02 (1.41) | 83 (32) | 1.01 (0.00) | 99.3 (37.5) | 19.5 (2.9) | 7.3 (2.9) | 1.46 (0.52) | 23% | 2.62 (1.21) |


