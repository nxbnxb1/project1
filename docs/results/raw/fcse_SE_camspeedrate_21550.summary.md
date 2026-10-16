# DART ablation summary

Sweep: camspeedrate = 21550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.41 (1.26) | 38.20 (27.19) | 7.18 (2.30) | 102 (134) | 1.96 (1.21) | 122.1 (158.6) | 21.7 (2.4) | 6.9 (5.0) | 1.66 (0.57) | 20% | 3.58 (2.47) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 3.21 (1.84) | 30.05 (13.59) | 7.65 (1.85) | 153 (69) | 5.01 (0.01) | 183.7 (80.4) | 21.8 (2.5) | 7.5 (5.0) | 1.69 (0.59) | 22% | 3.93 (2.66) |


