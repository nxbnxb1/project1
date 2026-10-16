# DART ablation summary

Sweep: camspeedrate = 40635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.08 (0.49) | 63.19 (9.37) | 5.20 (0.53) | 81 (37) | 1.30 (0.46) | 387.6 (177.4) | 19.5 (2.8) | 4.4 (1.8) | 1.40 (0.49) | 12% | 2.48 (0.73) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.15 (0.45) | 65.23 (14.36) | 5.22 (0.60) | 185 (40) | 2.84 (0.04) | 889.8 (196.1) | 19.4 (2.6) | 4.8 (1.8) | 1.39 (0.46) | 13% | 2.75 (0.79) |


