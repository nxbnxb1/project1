# DART ablation summary

Sweep: camspeedrate = 20645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.09 (0.49) | 68.52 (18.98) | 5.04 (0.77) | 129 (89) | 1.76 (0.72) | 154.7 (107.5) | 18.6 (2.3) | 4.0 (1.6) | 1.27 (0.41) | 13% | 2.54 (0.87) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.17 (0.48) | 66.16 (13.52) | 5.17 (0.57) | 283 (65) | 4.36 (0.01) | 339.1 (80.5) | 18.9 (2.3) | 4.5 (1.6) | 1.31 (0.41) | 13% | 3.21 (1.35) |


