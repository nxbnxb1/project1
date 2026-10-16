# DART ablation summary

Sweep: camspeedrate = 10650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.05 (0.42) | 64.68 (10.13) | 5.15 (0.52) | 124 (56) | 1.90 (0.69) | 152.0 (69.4) | 18.9 (2.4) | 5.9 (2.2) | 1.32 (0.41) | 12% | 2.60 (0.80) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 1.00 (0.66) | 65.27 (14.29) | 4.95 (0.83) | 322 (88) | 5.01 (0.01) | 394.9 (109.1) | 19.1 (2.8) | 6.8 (2.7) | 1.35 (0.51) | 16% | 2.96 (0.80) |


