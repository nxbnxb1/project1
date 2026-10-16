# DART ablation summary

Sweep: camspeedrate = 40645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.19 (0.49) | 63.94 (8.13) | 5.17 (0.48) | 85 (33) | 1.32 (0.42) | 406.6 (159.5) | 19.4 (2.6) | 4.7 (1.9) | 1.39 (0.47) | 12% | 2.41 (0.69) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.16 (0.42) | 65.99 (13.89) | 5.13 (0.66) | 192 (41) | 2.91 (0.04) | 923.0 (193.5) | 19.3 (2.8) | 4.8 (1.9) | 1.38 (0.49) | 13% | 2.78 (0.91) |


