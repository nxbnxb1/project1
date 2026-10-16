# DART ablation summary

Sweep: camspeedrate = 40650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.70 (0.44) | 90.62 (21.30) | 4.29 (0.62) | 165 (68) | 1.90 (0.42) | 798.9 (331.3) | 25.2 (0.8) | 14.9 (1.6) | 2.42 (0.16) | 31% | 2.22 (0.60) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.67 (0.52) | 89.86 (29.57) | 4.50 (0.74) | 242 (97) | 2.91 (0.04) | 1161.4 (462.8) | 25.3 (0.9) | 15.9 (1.3) | 2.41 (0.18) | 28% | 2.28 (0.39) |


