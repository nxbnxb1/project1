# DART ablation summary

Sweep: camspeedrate = 11515

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 53% [30, 75] | 0.16 (0.30) | 88.86 (10.47) | 5.68 (1.69) | 64 (48) | 1.24 (0.16) | 78.2 (59.2) | 24.0 (1.4) | 10.2 (2.4) | 2.23 (0.29) | 48% | 2.45 (0.81) |
| FR_SAFE | 15 | 40% [20, 64] | 40% [20, 64] | 0.34 (0.45) | 122.76 (55.34) | 3.96 (1.98) | 132 (88) | 1.51 (0.04) | 159.7 (107.1) | 24.4 (1.3) | 12.3 (2.4) | 2.33 (0.23) | 50% | 2.51 (0.86) |


