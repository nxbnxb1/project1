# DART ablation summary

Sweep: camspeedrate = 21515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 63% [46, 78] | 37% [22, 54] | 0.88 (1.34) | 51.49 (18.75) | 6.73 (2.08) | 51 (34) | 1.11 (0.25) | 61.5 (40.6) | 22.6 (1.7) | 4.1 (1.5) | 1.85 (0.38) | 27% | 2.33 (0.78) |
| FR_SAFE | 30 | 70% [52, 83] | 30% [17, 48] | 0.75 (0.90) | 53.74 (16.24) | 6.39 (1.80) | 72 (32) | 1.51 (0.02) | 86.6 (39.3) | 22.6 (1.9) | 4.5 (1.7) | 1.88 (0.39) | 31% | 2.53 (1.18) |


