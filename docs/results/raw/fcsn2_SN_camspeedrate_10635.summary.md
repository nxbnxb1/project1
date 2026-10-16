# DART ablation summary

Sweep: camspeedrate = 10635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 7% [2, 21] | 1.01 (0.54) | 71.68 (23.07) | 4.72 (1.13) | 128 (93) | 1.57 (0.70) | 155.9 (115.5) | 19.0 (2.5) | 7.5 (3.3) | 1.35 (0.46) | 17% | 2.47 (0.88) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.29 (0.53) | 69.46 (16.33) | 5.01 (0.73) | 238 (56) | 3.45 (0.00) | 292.7 (70.0) | 18.9 (2.4) | 7.8 (2.9) | 1.31 (0.43) | 14% | 3.03 (1.17) |


