# DART ablation summary

Sweep: camspeedrate = 41050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.21 (0.61) | 44.32 (10.06) | 7.50 (1.23) | 74 (32) | 1.63 (0.44) | 355.6 (155.5) | 23.1 (1.9) | 6.0 (2.5) | 1.90 (0.42) | 26% | 2.48 (0.77) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.30 (0.34) | 45.33 (10.91) | 7.62 (1.21) | 132 (31) | 2.91 (0.05) | 636.6 (152.8) | 23.1 (1.6) | 6.5 (2.5) | 1.90 (0.37) | 26% | 2.73 (0.80) |


