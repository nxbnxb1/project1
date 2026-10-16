# DART ablation summary

Sweep: camspeedrate = 10635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.63 (0.48) | 105.64 (31.06) | 3.44 (1.12) | 225 (131) | 2.23 (0.62) | 274.9 (162.4) | 22.7 (1.4) | 12.5 (1.2) | 2.05 (0.21) | 34% | 2.42 (0.72) |
| FR_SAFE | 15 | 87% [62, 96] | 13% [4, 38] | 0.77 (0.46) | 115.01 (27.81) | 3.56 (0.66) | 358 (136) | 3.45 (0.00) | 438.0 (168.4) | 24.2 (1.2) | 14.6 (1.1) | 2.28 (0.18) | 38% | 2.31 (0.40) |


