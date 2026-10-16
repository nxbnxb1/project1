# DART ablation summary

Sweep: camspeedrate = 10630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.09 (0.62) | 75.87 (24.03) | 4.71 (0.94) | 114 (73) | 1.41 (0.52) | 139.8 (91.1) | 18.8 (2.3) | 7.3 (2.7) | 1.32 (0.41) | 16% | 2.38 (0.81) |
| FR_SAFE | 30 | 93% [79, 98] | 0% [0, 11] | 1.26 (0.50) | 76.41 (25.41) | 4.61 (1.05) | 230 (75) | 2.95 (0.00) | 282.2 (92.4) | 19.5 (2.5) | 8.7 (3.1) | 1.43 (0.45) | 18% | 3.08 (0.91) |


