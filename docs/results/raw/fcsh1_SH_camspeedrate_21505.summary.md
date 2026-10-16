# DART ablation summary

Sweep: camspeedrate = 21505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 93% [70, 99] | -0.03 (0.05) | NaN (NaN) | 6.77 (1.43) | 11 (15) | 0.58 (0.11) | 12.8 (18.3) | 20.9 (1.9) | 3.7 (1.3) | 1.60 (0.38) | 29% | 2.22 (1.06) |
| FR_SAFE | 15 | 7% [1, 30] | 93% [70, 99] | -0.02 (0.04) | 50.99 (0.00) | 6.74 (1.87) | 10 (16) | 0.59 (0.09) | 12.3 (18.2) | 20.7 (2.4) | 3.0 (1.2) | 1.56 (0.44) | 24% | 2.25 (1.28) |


