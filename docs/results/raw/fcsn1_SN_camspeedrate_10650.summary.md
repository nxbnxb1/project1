# DART ablation summary

Sweep: camspeedrate = 10650

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.03 (0.52) | 70.91 (20.14) | 5.02 (0.77) | 143 (101) | 1.88 (0.72) | 175.7 (123.7) | 18.5 (2.6) | 6.7 (3.0) | 1.25 (0.46) | 15% | 2.71 (0.68) |
| FR_SAFE | 30 | 90% [74, 97] | 7% [2, 21] | 1.07 (0.50) | 68.97 (19.54) | 4.95 (0.88) | 342 (104) | 5.01 (0.00) | 417.8 (126.8) | 18.7 (2.7) | 8.0 (3.3) | 1.28 (0.46) | 15% | 3.14 (0.64) |


