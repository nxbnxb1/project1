# DART ablation summary

Sweep: camspeedrate = 11015

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 47% [25, 70] | 0.48 (0.78) | 109.25 (37.09) | 3.66 (1.35) | 105 (56) | 1.25 (0.14) | 128.7 (68.5) | 24.1 (1.3) | 12.1 (2.2) | 2.30 (0.24) | 49% | 2.28 (0.47) |
| FR_SAFE | 15 | 53% [30, 75] | 33% [15, 58] | 0.43 (0.41) | 130.18 (45.64) | 3.60 (1.04) | 160 (81) | 1.50 (0.01) | 195.2 (99.4) | 23.8 (1.2) | 11.8 (1.5) | 2.25 (0.19) | 48% | 2.13 (0.31) |


