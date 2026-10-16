# DART ablation summary

Sweep: camspeedrate = 10615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 53% [30, 75] | 47% [25, 70] | 0.19 (0.28) | 159.88 (59.47) | 3.02 (1.07) | 149 (95) | 1.17 (0.15) | 183.5 (116.5) | 22.6 (2.0) | 8.6 (1.3) | 2.03 (0.34) | 37% | 2.47 (0.77) |
| FR_SAFE | 15 | 53% [30, 75] | 40% [20, 64] | 0.52 (0.48) | 129.92 (39.64) | 3.13 (0.74) | 149 (75) | 1.50 (0.02) | 182.4 (91.4) | 23.8 (1.5) | 9.7 (1.2) | 2.24 (0.24) | 41% | 2.43 (0.61) |


