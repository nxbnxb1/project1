# DART ablation summary

Sweep: camspeedrate = 41015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 3.30 (1.91) | 38.85 (27.48) | 7.09 (2.41) | 42 (43) | 0.91 (0.30) | 198.6 (205.1) | 22.4 (3.3) | 8.2 (6.1) | 1.81 (0.74) | 25% | 3.50 (2.74) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 3.19 (1.92) | 39.59 (25.09) | 6.94 (2.45) | 60 (37) | 1.51 (0.01) | 286.7 (180.5) | 22.6 (3.5) | 8.5 (6.3) | 1.84 (0.77) | 27% | 3.56 (2.56) |


