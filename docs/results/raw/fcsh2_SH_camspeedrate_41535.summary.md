# DART ablation summary

Sweep: camspeedrate = 41535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.86 (0.52) | 61.40 (14.95) | 6.05 (0.86) | 112 (51) | 1.96 (0.36) | 542.9 (247.7) | 26.3 (0.9) | 11.5 (1.5) | 2.64 (0.20) | 45% | 2.06 (0.53) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.89 (0.41) | 67.90 (17.77) | 5.76 (0.91) | 185 (59) | 2.84 (0.04) | 886.1 (277.4) | 26.3 (1.0) | 12.4 (0.9) | 2.65 (0.19) | 50% | 2.33 (0.54) |


