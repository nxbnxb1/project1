# DART ablation summary

Sweep: camspeedrate = 10640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 13% [5, 30] | 1.00 (0.70) | 73.47 (21.17) | 4.74 (0.92) | 143 (104) | 1.72 (0.65) | 173.8 (126.9) | 18.9 (2.8) | 7.2 (3.1) | 1.33 (0.49) | 17% | 2.63 (0.72) |
| FR_SAFE | 30 | 93% [79, 98] | 3% [1, 17] | 1.21 (0.49) | 70.58 (19.82) | 4.92 (0.93) | 283 (77) | 4.01 (0.01) | 346.1 (94.3) | 19.1 (2.9) | 8.4 (3.7) | 1.35 (0.52) | 17% | 3.17 (0.78) |


