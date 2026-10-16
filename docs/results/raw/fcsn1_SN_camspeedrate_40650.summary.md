# DART ablation summary

Sweep: camspeedrate = 40650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.24 (0.59) | 66.72 (17.10) | 5.15 (0.68) | 93 (55) | 1.31 (0.44) | 448.2 (265.3) | 19.2 (3.0) | 4.3 (2.1) | 1.36 (0.53) | 13% | 2.55 (0.70) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.10 (0.36) | 64.66 (11.93) | 5.20 (0.58) | 184 (39) | 2.91 (0.04) | 888.5 (191.3) | 19.0 (2.9) | 4.5 (2.0) | 1.33 (0.51) | 13% | 2.76 (0.84) |


