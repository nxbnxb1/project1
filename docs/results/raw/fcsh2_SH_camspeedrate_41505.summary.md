# DART ablation summary

Sweep: camspeedrate = 41505

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 40% [20, 64] | 0.26 (0.38) | 115.58 (45.22) | 3.85 (1.82) | 51 (48) | 0.49 (0.02) | 243.0 (230.2) | 25.3 (1.9) | 14.2 (2.9) | 2.48 (0.35) | 51% | 1.82 (0.37) |
| FR_SAFE | 15 | 27% [11, 52] | 73% [48, 89] | 0.11 (0.36) | 85.14 (14.07) | 4.14 (1.27) | 33 (21) | 0.52 (0.01) | 157.7 (104.3) | 25.2 (1.3) | 14.5 (2.7) | 2.45 (0.23) | 44% | 1.56 (0.38) |


