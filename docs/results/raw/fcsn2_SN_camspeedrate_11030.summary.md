# DART ablation summary

Sweep: camspeedrate = 11030

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 3% [1, 17] | 1.33 (0.81) | 54.81 (26.63) | 6.56 (2.15) | 117 (89) | 1.73 (0.56) | 142.9 (111.1) | 22.2 (2.2) | 6.2 (2.2) | 1.79 (0.41) | 27% | 2.36 (0.82) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.21 (0.73) | 56.62 (29.01) | 6.75 (1.77) | 163 (84) | 2.95 (0.01) | 199.1 (103.8) | 23.1 (1.4) | 7.0 (2.2) | 1.93 (0.32) | 30% | 2.89 (1.35) |


