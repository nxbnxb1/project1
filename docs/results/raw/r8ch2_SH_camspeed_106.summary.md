# DART ablation summary

Sweep: camspeed = 106

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 13% [4, 38] | 1.34 (0.74) | 201.76 (68.20) | 2.09 (1.06) | 150 (91) | 1.04 (0.56) | 183.9 (111.5) | 17.9 (3.8) | 4.1 (1.3) | 1.30 (0.59) | 30% | 2.40 (0.76) |
| FR_SAFE_3 | 15 | 80% [55, 93] | 7% [1, 30] | 1.20 (0.46) | 144.88 (33.36) | 3.08 (0.73) | 403 (107) | 2.94 (0.00) | 492.1 (130.0) | 22.3 (2.2) | 5.9 (1.4) | 1.99 (0.38) | 40% | 2.53 (0.63) |


