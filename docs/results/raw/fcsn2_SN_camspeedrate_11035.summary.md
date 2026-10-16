# DART ablation summary

Sweep: camspeedrate = 11035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.09 (0.72) | 53.65 (21.60) | 6.37 (2.12) | 118 (76) | 2.08 (0.64) | 144.3 (92.8) | 22.9 (1.8) | 5.0 (1.7) | 1.92 (0.38) | 29% | 2.39 (0.89) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 1.28 (0.61) | 53.31 (18.96) | 6.83 (1.70) | 184 (65) | 3.46 (0.01) | 226.3 (81.5) | 23.1 (1.4) | 5.1 (1.7) | 1.94 (0.33) | 29% | 2.63 (1.13) |


