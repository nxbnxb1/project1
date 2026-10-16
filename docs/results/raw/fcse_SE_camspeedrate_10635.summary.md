# DART ablation summary

Sweep: camspeedrate = 10635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.34 (1.11) | 58.00 (36.12) | 4.73 (1.37) | 101 (128) | 1.24 (0.90) | 124.0 (157.3) | 18.8 (4.3) | 4.7 (3.2) | 1.33 (0.78) | 14% | 3.99 (2.80) |
| FR_SAFE | 30 | 90% [74, 97] | 7% [2, 21] | 2.15 (1.19) | 52.84 (37.34) | 4.70 (1.52) | 196 (131) | 3.46 (0.01) | 240.2 (162.5) | 18.8 (4.7) | 5.4 (3.7) | 1.34 (0.82) | 14% | 3.86 (2.45) |


