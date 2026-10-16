# DART ablation summary

Sweep: camspeedrate = 10620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 17% [7, 34] | 1.04 (0.71) | 77.82 (27.99) | 4.65 (1.09) | 79 (57) | 1.05 (0.34) | 96.2 (70.2) | 18.8 (2.4) | 7.4 (3.0) | 1.32 (0.44) | 17% | 2.64 (1.47) |
| FR_SAFE | 30 | 80% [63, 90] | 10% [3, 26] | 1.07 (0.63) | 72.81 (21.91) | 4.50 (1.13) | 150 (60) | 2.01 (0.00) | 183.3 (73.9) | 19.2 (2.8) | 8.1 (3.3) | 1.38 (0.51) | 19% | 2.80 (0.94) |


