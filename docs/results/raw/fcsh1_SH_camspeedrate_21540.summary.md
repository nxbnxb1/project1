# DART ablation summary

Sweep: camspeedrate = 21540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.39 (0.32) | 86.68 (24.48) | 5.06 (1.23) | 212 (114) | 2.78 (0.46) | 255.2 (136.4) | 24.9 (0.9) | 6.5 (1.0) | 2.39 (0.18) | 46% | 2.27 (0.47) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.63 (0.49) | 77.76 (19.80) | 5.08 (1.02) | 275 (117) | 4.02 (0.03) | 330.2 (141.6) | 25.7 (1.2) | 7.8 (1.3) | 2.56 (0.23) | 48% | 2.40 (0.39) |


