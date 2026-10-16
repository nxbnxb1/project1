# DART ablation summary

Sweep: camspeedrate = 21040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 7% [2, 21] | 1.38 (0.88) | 50.55 (16.47) | 6.68 (1.99) | 123 (78) | 2.21 (0.72) | 146.6 (93.4) | 22.2 (1.8) | 6.0 (2.3) | 1.77 (0.37) | 27% | 2.63 (0.80) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.37 (0.75) | 47.87 (18.41) | 7.47 (1.43) | 189 (73) | 4.01 (0.01) | 226.5 (86.8) | 22.4 (1.8) | 6.1 (2.2) | 1.77 (0.37) | 24% | 3.12 (0.94) |


