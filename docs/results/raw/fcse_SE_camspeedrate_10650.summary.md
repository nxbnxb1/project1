# DART ablation summary

Sweep: camspeedrate = 10650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.92 (1.15) | 46.12 (18.57) | 4.86 (1.17) | 114 (141) | 1.73 (1.24) | 138.9 (171.5) | 18.8 (4.5) | 7.2 (5.1) | 1.34 (0.80) | 14% | 3.86 (2.75) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.12 (1.34) | 45.52 (27.81) | 5.17 (0.97) | 218 (140) | 5.01 (0.01) | 265.8 (171.1) | 19.0 (4.5) | 8.2 (5.3) | 1.36 (0.79) | 11% | 4.38 (2.71) |


