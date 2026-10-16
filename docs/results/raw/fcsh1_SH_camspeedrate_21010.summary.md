# DART ablation summary

Sweep: camspeedrate = 21010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 7% [1, 30] | 87% [62, 96] | 0.12 (0.57) | 96.90 (0.00) | 4.42 (2.03) | 51 (38) | 0.95 (0.10) | 61.1 (46.2) | 22.4 (2.4) | 9.0 (3.0) | 1.99 (0.44) | 40% | 2.43 (1.32) |
| FR_SAFE | 15 | 20% [7, 45] | 80% [55, 93] | 0.04 (0.16) | 160.40 (66.45) | 4.56 (1.85) | 69 (64) | 1.03 (0.04) | 82.7 (76.6) | 22.5 (3.2) | 9.6 (2.9) | 1.99 (0.55) | 40% | 2.37 (0.86) |


