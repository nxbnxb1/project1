# DART ablation summary

Sweep: camspeedrate = 21520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 10% [3, 26] | 1.11 (0.83) | 48.78 (21.47) | 7.20 (1.78) | 68 (53) | 1.30 (0.31) | 82.3 (64.9) | 22.3 (1.5) | 3.7 (1.2) | 1.77 (0.33) | 26% | 2.37 (0.80) |
| FR_SAFE | 30 | 77% [59, 88] | 23% [12, 41] | 0.94 (1.11) | 54.96 (22.29) | 6.83 (1.90) | 97 (53) | 2.01 (0.01) | 117.0 (64.4) | 22.5 (1.4) | 4.3 (1.6) | 1.84 (0.33) | 28% | 2.54 (1.24) |


