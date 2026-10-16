# DART ablation summary

Sweep: camspeedrate = 40635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.17 (0.42) | 64.44 (13.11) | 5.18 (0.62) | 83 (46) | 1.30 (0.49) | 398.2 (221.9) | 19.2 (3.1) | 8.0 (4.1) | 1.36 (0.56) | 13% | 2.71 (0.73) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.22 (0.35) | 65.87 (12.07) | 5.23 (0.51) | 187 (35) | 2.84 (0.03) | 899.1 (163.8) | 19.0 (2.7) | 8.3 (3.5) | 1.32 (0.46) | 12% | 2.69 (0.71) |


