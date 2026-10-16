# DART ablation summary

Sweep: camspeedrate = 21510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 60% [42, 75] | 40% [25, 58] | 0.45 (0.67) | 66.40 (57.00) | 7.46 (2.48) | 39 (48) | 0.77 (0.11) | 46.6 (58.4) | 22.1 (2.0) | 6.2 (3.3) | 1.70 (0.44) | 24% | 2.77 (1.32) |
| FR_SAFE | 30 | 60% [42, 75] | 33% [19, 51] | 0.67 (0.71) | 54.71 (35.04) | 6.99 (2.42) | 52 (36) | 1.02 (0.01) | 63.1 (43.8) | 21.7 (2.1) | 6.5 (3.0) | 1.68 (0.41) | 26% | 2.51 (0.82) |


