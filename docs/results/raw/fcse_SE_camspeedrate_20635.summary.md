# DART ablation summary

Sweep: camspeedrate = 20635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.92 (1.07) | 47.15 (20.84) | 4.86 (1.28) | 87 (111) | 1.23 (0.92) | 104.1 (133.7) | 18.6 (4.3) | 5.1 (3.6) | 1.30 (0.77) | 13% | 3.69 (2.62) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 2.25 (1.27) | 47.84 (24.16) | 4.98 (1.23) | 168 (83) | 3.46 (0.01) | 201.6 (98.2) | 19.3 (4.7) | 6.1 (4.0) | 1.41 (0.83) | 13% | 4.44 (2.92) |


