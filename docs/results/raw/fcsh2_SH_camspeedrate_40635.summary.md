# DART ablation summary

Sweep: camspeedrate = 40635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.88 (0.42) | 84.35 (19.05) | 4.44 (0.69) | 156 (71) | 1.88 (0.46) | 751.4 (337.4) | 25.1 (1.1) | 15.0 (1.9) | 2.39 (0.22) | 27% | 2.05 (0.42) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.68 (0.36) | 87.03 (22.70) | 4.40 (0.79) | 237 (77) | 2.84 (0.04) | 1131.9 (359.7) | 25.2 (1.1) | 16.0 (1.5) | 2.41 (0.21) | 29% | 2.29 (0.41) |


