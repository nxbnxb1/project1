# DART ablation summary

Sweep: camspeedrate = 41030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.09 (1.92) | 35.87 (20.55) | 7.20 (2.17) | 57 (58) | 1.28 (0.61) | 273.0 (279.9) | 21.9 (2.8) | 4.2 (2.8) | 1.72 (0.64) | 24% | 3.36 (2.76) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 3.16 (2.14) | 32.53 (16.89) | 7.46 (1.83) | 86 (45) | 2.70 (0.04) | 414.5 (219.2) | 22.1 (2.7) | 4.4 (2.9) | 1.74 (0.63) | 22% | 3.74 (2.50) |


