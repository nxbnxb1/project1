# DART ablation summary

Sweep: camspeedrate = 11510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 13% [4, 38] | 87% [62, 96] | 0.06 (0.30) | 85.99 (16.82) | 5.17 (2.53) | 42 (36) | 0.94 (0.08) | 51.2 (44.2) | 22.4 (2.5) | 10.0 (2.4) | 1.96 (0.41) | 41% | 2.35 (0.89) |
| FR_SAFE | 15 | 0% [0, 20] | 100% [80, 100] | -0.03 (0.03) | NaN (NaN) | 4.31 (2.43) | 61 (53) | 1.02 (0.03) | 74.2 (64.5) | 23.3 (1.9) | 10.7 (2.3) | 2.13 (0.33) | 47% | 2.35 (0.78) |


