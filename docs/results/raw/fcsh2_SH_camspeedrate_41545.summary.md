# DART ablation summary

Sweep: camspeedrate = 41545

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.83 (0.33) | 67.11 (12.82) | 5.54 (0.67) | 140 (33) | 2.12 (0.30) | 677.1 (163.7) | 26.5 (0.8) | 16.0 (1.4) | 2.69 (0.16) | 48% | 2.07 (0.49) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.82 (0.38) | 63.93 (19.31) | 5.92 (1.42) | 176 (68) | 2.92 (0.06) | 843.8 (321.9) | 26.1 (1.4) | 15.8 (1.7) | 2.62 (0.25) | 50% | 2.32 (0.58) |


