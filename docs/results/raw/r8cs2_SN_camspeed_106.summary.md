# DART ablation summary

Sweep: camspeed = 106

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 3% [1, 17] | 1.55 (0.69) | 98.59 (37.11) | 3.73 (1.34) | 103 (53) | 1.00 (0.39) | 125.4 (65.9) | 16.8 (2.3) | 4.1 (1.3) | 1.04 (0.37) | 19% | 2.25 (0.74) |
| FR_SAFE_3 | 30 | 97% [83, 99] | 0% [0, 11] | 1.62 (0.80) | 88.53 (37.59) | 4.53 (1.08) | 261 (109) | 2.95 (0.00) | 321.0 (135.3) | 18.5 (2.1) | 4.7 (1.4) | 1.28 (0.38) | 20% | 3.08 (1.32) |


