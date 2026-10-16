# DART ablation summary

Sweep: camspeedrate = 41035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.83 (0.51) | 65.67 (14.21) | 5.72 (0.97) | 124 (56) | 2.00 (0.42) | 597.3 (271.7) | 26.5 (0.9) | 10.0 (0.9) | 2.68 (0.17) | 47% | 2.31 (0.44) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 1.05 (0.33) | 66.95 (15.00) | 5.57 (0.75) | 190 (43) | 2.84 (0.04) | 912.8 (203.2) | 26.3 (0.8) | 10.2 (0.6) | 2.66 (0.16) | 49% | 2.20 (0.43) |


