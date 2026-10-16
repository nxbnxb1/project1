# DART ablation summary

Sweep: camspeedrate = 41020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 3.20 (2.34) | 33.98 (18.22) | 7.25 (2.06) | 42 (37) | 1.06 (0.44) | 200.1 (178.0) | 22.1 (2.9) | 4.6 (3.2) | 1.77 (0.67) | 25% | 3.41 (2.73) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.20 (2.08) | 40.06 (32.77) | 7.13 (2.34) | 80 (65) | 2.01 (0.01) | 385.3 (312.8) | 22.6 (3.2) | 5.1 (3.5) | 1.84 (0.72) | 26% | 3.25 (2.51) |


