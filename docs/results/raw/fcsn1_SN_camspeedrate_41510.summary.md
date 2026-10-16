# DART ablation summary

Sweep: camspeedrate = 41510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 10% [3, 26] | 1.31 (0.91) | 49.45 (18.30) | 7.43 (2.32) | 41 (24) | 0.85 (0.07) | 198.3 (116.5) | 24.3 (1.6) | 6.6 (3.0) | 2.17 (0.35) | 34% | 2.29 (0.72) |
| FR_SAFE | 30 | 83% [66, 93] | 17% [7, 34] | 1.18 (0.91) | 51.19 (25.75) | 7.65 (2.54) | 49 (28) | 1.01 (0.01) | 235.0 (134.3) | 24.3 (1.5) | 6.7 (3.1) | 2.16 (0.33) | 34% | 2.31 (0.70) |


