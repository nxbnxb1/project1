# DART ablation summary

Sweep: camspeedrate = 41030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.39 (0.57) | 46.98 (11.24) | 7.30 (1.32) | 77 (34) | 1.56 (0.38) | 366.5 (163.3) | 23.5 (1.6) | 9.3 (3.3) | 1.99 (0.37) | 27% | 2.46 (0.87) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.38 (1.13) | 46.57 (12.87) | 7.34 (1.41) | 123 (39) | 2.70 (0.03) | 587.7 (185.9) | 23.5 (1.7) | 9.9 (3.4) | 1.99 (0.38) | 28% | 2.43 (0.83) |


