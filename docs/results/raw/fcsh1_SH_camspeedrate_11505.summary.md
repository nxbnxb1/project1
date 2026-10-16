# DART ablation summary

Sweep: camspeedrate = 11505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 100% [80, 100] | -0.03 (0.03) | NaN (NaN) | 6.03 (2.01) | 11 (10) | 0.53 (0.07) | 13.4 (11.9) | 21.9 (1.7) | 5.6 (0.9) | 1.80 (0.34) | 39% | 2.35 (1.35) |
| FR_SAFE | 15 | 0% [0, 20] | 100% [80, 100] | -0.03 (0.03) | NaN (NaN) | 5.39 (2.56) | 10 (10) | 0.58 (0.09) | 12.6 (11.8) | 21.3 (1.9) | 5.7 (1.7) | 1.71 (0.37) | 30% | 2.08 (1.16) |


