# DART ablation summary

Sweep: camspeedrate = 40625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.67 (0.48) | 81.92 (12.99) | 4.39 (0.66) | 122 (45) | 1.77 (0.36) | 587.6 (219.9) | 25.5 (1.6) | 15.1 (2.1) | 2.47 (0.27) | 27% | 2.19 (0.62) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.61 (0.48) | 91.91 (25.73) | 4.40 (0.71) | 205 (78) | 2.43 (0.02) | 981.4 (371.2) | 24.9 (1.4) | 15.2 (1.7) | 2.37 (0.26) | 28% | 2.23 (0.58) |


