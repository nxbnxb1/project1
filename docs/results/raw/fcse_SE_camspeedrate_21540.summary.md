# DART ablation summary

Sweep: camspeedrate = 21540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.76 (1.63) | 33.67 (19.40) | 7.43 (2.11) | 66 (74) | 1.60 (0.90) | 78.4 (88.8) | 21.3 (2.2) | 6.7 (4.6) | 1.59 (0.53) | 21% | 3.71 (2.50) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.88 (1.96) | 31.87 (15.26) | 7.42 (2.07) | 130 (61) | 4.01 (0.01) | 155.9 (73.5) | 21.9 (2.6) | 7.8 (5.3) | 1.71 (0.61) | 24% | 3.97 (2.57) |


