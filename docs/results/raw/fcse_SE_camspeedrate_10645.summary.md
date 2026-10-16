# DART ablation summary

Sweep: camspeedrate = 10645

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 7% [2, 21] | 1.95 (1.33) | 51.02 (27.65) | 4.70 (1.34) | 116 (139) | 1.65 (1.24) | 142.4 (170.8) | 19.3 (4.9) | 6.1 (4.4) | 1.43 (0.88) | 16% | 3.92 (2.59) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.28 (1.56) | 58.30 (37.96) | 4.76 (1.30) | 254 (165) | 4.36 (0.01) | 311.3 (204.1) | 19.1 (4.5) | 6.4 (4.2) | 1.39 (0.81) | 17% | 4.26 (2.50) |


