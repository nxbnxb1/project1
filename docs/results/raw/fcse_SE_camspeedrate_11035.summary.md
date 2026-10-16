# DART ablation summary

Sweep: camspeedrate = 11035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 2.74 (1.85) | 37.77 (24.36) | 7.04 (2.41) | 81 (100) | 1.45 (0.83) | 98.9 (123.8) | 21.7 (2.6) | 5.4 (4.0) | 1.68 (0.62) | 21% | 4.06 (2.91) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.87 (1.86) | 31.91 (16.58) | 7.42 (1.98) | 112 (56) | 3.47 (0.01) | 138.1 (68.4) | 22.0 (2.8) | 6.0 (4.1) | 1.74 (0.64) | 23% | 3.80 (2.81) |


