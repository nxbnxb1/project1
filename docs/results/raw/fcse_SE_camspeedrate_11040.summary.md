# DART ablation summary

Sweep: camspeedrate = 11040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.62 (1.80) | 33.57 (18.18) | 7.26 (2.07) | 67 (72) | 1.65 (0.93) | 82.6 (88.8) | 21.7 (2.6) | 7.1 (5.2) | 1.67 (0.59) | 21% | 3.95 (2.65) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 3.04 (1.84) | 36.09 (20.91) | 7.13 (2.37) | 148 (83) | 4.02 (0.01) | 181.1 (103.4) | 21.8 (2.6) | 7.9 (5.5) | 1.69 (0.62) | 23% | 3.98 (2.64) |


