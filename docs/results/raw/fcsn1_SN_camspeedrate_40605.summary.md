# DART ablation summary

Sweep: camspeedrate = 40605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 77% [59, 88] | 20% [10, 37] | 1.05 (0.85) | 93.60 (46.25) | 4.26 (1.19) | 37 (23) | 0.40 (0.06) | 178.7 (106.9) | 19.9 (3.0) | 7.7 (3.8) | 1.52 (0.55) | 23% | 2.13 (0.72) |
| FR_SAFE | 30 | 60% [42, 75] | 37% [22, 54] | 0.91 (0.90) | 74.09 (23.52) | 4.71 (0.94) | 34 (14) | 0.51 (0.01) | 161.7 (63.7) | 19.4 (3.3) | 6.9 (3.5) | 1.42 (0.58) | 16% | 2.32 (0.91) |


