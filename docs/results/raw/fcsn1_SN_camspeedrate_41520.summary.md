# DART ablation summary

Sweep: camspeedrate = 41520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.25 (0.83) | 46.64 (19.26) | 8.18 (2.46) | 69 (44) | 1.44 (0.20) | 333.1 (210.8) | 24.6 (1.6) | 7.0 (3.1) | 2.25 (0.33) | 33% | 2.32 (0.70) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.47 (0.64) | 41.37 (14.13) | 8.53 (1.77) | 83 (28) | 2.00 (0.01) | 399.0 (136.6) | 24.7 (1.1) | 7.2 (2.7) | 2.26 (0.24) | 34% | 2.48 (0.91) |


