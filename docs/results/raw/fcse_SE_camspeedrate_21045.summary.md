# DART ablation summary

Sweep: camspeedrate = 21045

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 2.46 (1.34) | 39.98 (27.00) | 7.05 (2.32) | 97 (117) | 1.78 (1.09) | 116.3 (139.9) | 22.0 (2.8) | 5.2 (3.7) | 1.74 (0.65) | 22% | 3.62 (2.50) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 2.59 (1.73) | 33.75 (18.82) | 7.28 (2.05) | 144 (82) | 4.37 (0.02) | 172.9 (98.8) | 22.0 (2.7) | 5.6 (3.6) | 1.74 (0.63) | 24% | 3.90 (2.61) |


