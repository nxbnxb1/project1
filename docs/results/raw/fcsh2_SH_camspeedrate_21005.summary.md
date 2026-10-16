# DART ablation summary

Sweep: camspeedrate = 21005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 0% [0, 20] | 87% [62, 96] | 0.03 (0.25) | NaN (NaN) | 6.76 (2.49) | 14 (17) | 0.54 (0.08) | 17.3 (20.9) | 21.3 (2.2) | 6.2 (2.1) | 1.65 (0.33) | 26% | 2.11 (1.08) |
| FR_SAFE | 15 | 0% [0, 20] | 93% [70, 99] | 0.03 (0.25) | NaN (NaN) | 7.06 (2.02) | 9 (14) | 0.58 (0.10) | 11.0 (17.7) | 21.1 (2.1) | 5.8 (2.4) | 1.61 (0.39) | 26% | 2.33 (1.04) |


