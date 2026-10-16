# DART ablation summary

Sweep: camspeedrate = 21025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.33 (1.49) | 49.47 (51.27) | 6.73 (2.71) | 85 (124) | 1.23 (0.65) | 101.4 (147.4) | 21.6 (2.6) | 4.1 (3.1) | 1.67 (0.61) | 21% | 3.45 (2.55) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.49 (1.65) | 35.67 (27.78) | 7.09 (2.30) | 90 (66) | 2.52 (0.02) | 108.4 (80.4) | 21.7 (2.5) | 4.3 (3.1) | 1.67 (0.60) | 22% | 3.79 (2.47) |


