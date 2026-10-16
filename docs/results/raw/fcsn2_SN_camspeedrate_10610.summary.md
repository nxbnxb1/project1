# DART ablation summary

Sweep: camspeedrate = 10610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 20% [10, 37] | 0.98 (0.89) | 89.65 (50.31) | 4.09 (1.52) | 59 (46) | 0.66 (0.19) | 72.3 (56.2) | 18.6 (2.2) | 6.6 (2.4) | 1.31 (0.41) | 21% | 2.07 (0.78) |
| FR_SAFE | 30 | 70% [52, 83] | 20% [10, 37] | 0.80 (0.63) | 86.14 (34.96) | 4.00 (1.42) | 79 (35) | 1.01 (0.01) | 96.9 (43.3) | 19.5 (2.9) | 7.6 (3.1) | 1.46 (0.51) | 21% | 2.50 (0.93) |


