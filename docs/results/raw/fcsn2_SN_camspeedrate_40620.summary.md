# DART ablation summary

Sweep: camspeedrate = 40620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.27 (0.45) | 70.18 (15.19) | 4.90 (0.78) | 79 (38) | 1.05 (0.33) | 376.2 (184.5) | 19.8 (2.9) | 4.4 (1.8) | 1.47 (0.52) | 17% | 2.41 (0.77) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.32 (0.47) | 65.78 (10.93) | 5.16 (0.57) | 131 (22) | 2.00 (0.01) | 630.4 (102.2) | 19.4 (2.8) | 4.5 (1.8) | 1.40 (0.50) | 13% | 2.59 (0.87) |


