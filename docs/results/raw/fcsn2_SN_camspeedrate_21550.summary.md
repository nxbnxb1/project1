# DART ablation summary

Sweep: camspeedrate = 21550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.14 (1.32) | 47.95 (15.02) | 7.29 (1.50) | 131 (82) | 2.69 (0.90) | 157.3 (97.6) | 22.7 (1.3) | 4.9 (1.6) | 1.84 (0.32) | 26% | 2.42 (0.68) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.06 (0.59) | 46.55 (13.80) | 7.39 (1.36) | 226 (76) | 5.01 (0.02) | 270.1 (92.4) | 23.0 (1.5) | 5.4 (1.9) | 1.89 (0.34) | 27% | 2.73 (1.00) |


