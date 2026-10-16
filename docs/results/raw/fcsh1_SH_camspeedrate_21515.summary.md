# DART ablation summary

Sweep: camspeedrate = 21515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 27% [11, 52] | 73% [48, 89] | 0.17 (0.39) | 95.53 (42.74) | 5.61 (1.72) | 57 (61) | 1.24 (0.24) | 68.0 (73.4) | 22.7 (2.7) | 9.3 (3.4) | 1.99 (0.51) | 37% | 2.40 (0.85) |
| FR_SAFE | 15 | 27% [11, 52] | 73% [48, 89] | 0.06 (0.18) | 130.26 (34.74) | 4.58 (1.70) | 93 (77) | 1.53 (0.08) | 112.2 (93.5) | 23.1 (2.5) | 10.4 (2.9) | 2.10 (0.48) | 44% | 2.18 (0.72) |


