# DART ablation summary

Sweep: camspeedrate = 20605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 20% [10, 37] | 1.63 (1.35) | 49.98 (34.41) | 4.54 (1.57) | 21 (21) | 0.35 (0.10) | 25.1 (24.6) | 18.1 (4.1) | 4.4 (3.2) | 1.23 (0.75) | 16% | 3.10 (2.35) |
| FR_SAFE | 30 | 77% [59, 88] | 20% [10, 37] | 2.11 (1.72) | 50.59 (41.12) | 4.46 (1.72) | 29 (22) | 0.51 (0.01) | 35.4 (26.3) | 18.3 (4.1) | 4.4 (3.1) | 1.25 (0.75) | 14% | 3.36 (2.33) |


