# DART ablation summary

Sweep: camspeedrate = 21540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.07 (0.81) | 52.52 (17.16) | 7.07 (1.62) | 121 (71) | 2.25 (0.63) | 145.6 (86.6) | 22.8 (1.5) | 9.1 (3.3) | 1.87 (0.34) | 27% | 2.39 (0.91) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.08 (0.77) | 47.61 (13.61) | 7.25 (1.74) | 190 (56) | 4.01 (0.01) | 227.5 (66.9) | 22.6 (1.9) | 9.6 (3.2) | 1.83 (0.38) | 28% | 2.74 (1.05) |


