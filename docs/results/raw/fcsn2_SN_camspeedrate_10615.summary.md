# DART ablation summary

Sweep: camspeedrate = 10615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 17% [7, 34] | 1.06 (0.74) | 73.96 (24.53) | 4.22 (1.27) | 71 (44) | 0.90 (0.30) | 86.7 (54.2) | 18.5 (2.1) | 5.6 (1.9) | 1.29 (0.38) | 18% | 2.09 (0.71) |
| FR_SAFE | 30 | 90% [74, 97] | 3% [1, 17] | 1.25 (0.79) | 79.11 (32.30) | 4.54 (1.20) | 120 (50) | 1.50 (0.01) | 147.0 (62.1) | 19.1 (2.6) | 5.7 (2.1) | 1.38 (0.47) | 18% | 2.56 (0.91) |


