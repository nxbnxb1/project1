# DART ablation summary

Sweep: camspeedrate = 10625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.07 (0.66) | 80.78 (36.79) | 4.65 (1.10) | 110 (91) | 1.22 (0.46) | 134.3 (111.0) | 18.7 (2.6) | 4.3 (1.9) | 1.30 (0.47) | 18% | 2.57 (0.72) |
| FR_SAFE | 30 | 87% [70, 95] | 10% [3, 26] | 1.10 (0.69) | 84.15 (41.91) | 4.60 (1.15) | 207 (99) | 2.51 (0.00) | 253.0 (122.6) | 18.8 (2.8) | 4.7 (2.2) | 1.32 (0.51) | 19% | 2.85 (0.73) |


