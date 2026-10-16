# DART ablation summary

Sweep: camspeedrate = 21035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.45 (0.43) | 91.27 (15.41) | 4.51 (0.96) | 203 (78) | 2.51 (0.35) | 244.1 (93.0) | 24.2 (1.1) | 11.7 (1.6) | 2.29 (0.18) | 44% | 2.21 (0.43) |
| FR_SAFE | 15 | 60% [36, 80] | 40% [20, 64] | 0.46 (0.56) | 85.70 (24.44) | 4.59 (1.02) | 238 (140) | 3.46 (0.02) | 286.1 (166.2) | 25.0 (1.3) | 13.3 (1.5) | 2.43 (0.22) | 49% | 2.31 (0.38) |


