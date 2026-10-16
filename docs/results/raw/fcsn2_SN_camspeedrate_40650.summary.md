# DART ablation summary

Sweep: camspeedrate = 40650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.12 (0.46) | 64.68 (10.46) | 5.12 (0.70) | 86 (41) | 1.35 (0.55) | 415.4 (199.7) | 19.4 (2.7) | 4.4 (1.8) | 1.40 (0.47) | 13% | 2.42 (0.67) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.15 (0.38) | 65.01 (11.56) | 5.15 (0.60) | 185 (43) | 2.92 (0.04) | 887.3 (205.6) | 19.4 (2.7) | 4.7 (1.8) | 1.40 (0.47) | 13% | 2.69 (0.95) |


