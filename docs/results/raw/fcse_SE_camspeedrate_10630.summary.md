# DART ablation summary

Sweep: camspeedrate = 10630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.83 (1.10) | 54.34 (38.24) | 4.73 (1.38) | 83 (112) | 1.20 (0.81) | 102.5 (138.3) | 19.2 (4.9) | 5.6 (4.2) | 1.40 (0.88) | 15% | 3.47 (2.47) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.28 (1.78) | 50.01 (24.74) | 4.81 (1.31) | 160 (101) | 2.95 (0.01) | 195.4 (124.5) | 19.4 (4.9) | 6.1 (4.4) | 1.44 (0.87) | 16% | 3.99 (2.58) |


