# DART ablation summary

Sweep: camspeedrate = 20635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.15 (0.55) | 80.14 (28.84) | 4.63 (1.00) | 139 (101) | 1.60 (0.62) | 166.5 (119.9) | 18.7 (2.7) | 7.7 (3.5) | 1.30 (0.48) | 18% | 2.54 (0.92) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 1.02 (0.58) | 70.04 (24.14) | 4.98 (0.95) | 235 (90) | 3.46 (0.03) | 280.8 (105.7) | 18.8 (2.9) | 7.9 (3.8) | 1.29 (0.52) | 14% | 2.77 (0.65) |


