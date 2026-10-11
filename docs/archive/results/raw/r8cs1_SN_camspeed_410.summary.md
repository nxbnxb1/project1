# DART ablation summary

Sweep: camspeed = 410

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 0% [0, 11] | 2.11 (0.89) | 48.67 (16.23) | 7.42 (1.74) | 67 (31) | 1.31 (0.37) | 323.8 (149.8) | 22.0 (2.0) | 5.0 (1.7) | 1.73 (0.40) | 23% | 2.83 (0.85) |
| FR_SAFE_3 | 30 | 100% [89, 100] | 0% [0, 11] | 1.52 (0.51) | 56.70 (30.51) | 7.15 (1.87) | 152 (82) | 2.69 (0.03) | 734.4 (393.7) | 22.2 (1.5) | 5.5 (1.9) | 1.76 (0.33) | 25% | 3.00 (0.82) |


