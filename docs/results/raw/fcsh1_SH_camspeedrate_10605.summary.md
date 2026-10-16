# DART ablation summary

Sweep: camspeedrate = 10605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 7% [1, 30] | 67% [42, 85] | 0.21 (0.43) | 226.11 (0.00) | 2.19 (1.03) | 44 (30) | 0.49 (0.03) | 53.2 (35.3) | 21.2 (3.0) | 9.2 (2.3) | 1.83 (0.48) | 40% | 2.34 (0.73) |
| FR_SAFE | 15 | 0% [0, 20] | 87% [62, 96] | 0.04 (0.16) | NaN (NaN) | 3.10 (1.33) | 35 (28) | 0.53 (0.04) | 42.7 (34.4) | 20.6 (2.6) | 8.8 (2.1) | 1.68 (0.44) | 31% | 1.92 (0.68) |


