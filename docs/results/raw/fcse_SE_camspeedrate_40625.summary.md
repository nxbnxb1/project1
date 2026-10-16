# DART ablation summary

Sweep: camspeedrate = 40625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 0% [0, 11] | 2.30 (1.24) | 45.21 (15.48) | 4.95 (1.07) | 55 (52) | 1.03 (0.65) | 266.9 (250.2) | 19.2 (5.2) | 5.7 (4.4) | 1.41 (0.93) | 15% | 3.27 (2.53) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.56 (1.37) | 46.18 (15.71) | 5.10 (0.85) | 112 (38) | 2.43 (0.02) | 540.4 (182.6) | 19.4 (5.1) | 6.1 (4.3) | 1.43 (0.91) | 14% | 3.82 (2.40) |


