# DART ablation summary

Sweep: camspeedrate = 11525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.23 (1.12) | 54.90 (34.30) | 6.98 (2.37) | 99 (81) | 1.70 (0.36) | 122.1 (102.2) | 23.2 (2.0) | 8.2 (2.7) | 2.00 (0.35) | 32% | 2.50 (1.38) |
| FR_SAFE | 30 | 83% [66, 93] | 13% [5, 30] | 1.11 (0.69) | 46.22 (20.26) | 7.76 (2.45) | 118 (56) | 2.51 (0.01) | 143.9 (69.4) | 23.4 (1.4) | 8.1 (3.2) | 2.01 (0.26) | 30% | 2.65 (1.25) |


