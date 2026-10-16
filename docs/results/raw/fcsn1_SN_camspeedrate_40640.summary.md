# DART ablation summary

Sweep: camspeedrate = 40640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.27 (0.64) | 64.76 (12.83) | 5.21 (0.61) | 87 (45) | 1.29 (0.43) | 419.3 (217.8) | 19.1 (3.0) | 8.8 (4.2) | 1.34 (0.52) | 12% | 2.47 (0.80) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.14 (0.35) | 65.33 (12.37) | 5.23 (0.55) | 189 (36) | 2.89 (0.04) | 909.4 (172.4) | 18.9 (2.9) | 9.3 (4.1) | 1.31 (0.50) | 13% | 2.86 (0.96) |


