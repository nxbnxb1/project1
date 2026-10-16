# DART ablation summary

Sweep: camspeedrate = 40630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.07 (0.45) | 64.64 (11.88) | 5.14 (0.67) | 85 (38) | 1.28 (0.42) | 407.6 (186.9) | 19.3 (2.7) | 8.0 (3.2) | 1.37 (0.48) | 13% | 2.42 (0.76) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.14 (0.35) | 61.75 (7.27) | 5.36 (0.36) | 166 (19) | 2.69 (0.02) | 797.7 (95.0) | 19.0 (2.4) | 8.1 (2.9) | 1.31 (0.42) | 10% | 2.56 (0.86) |


