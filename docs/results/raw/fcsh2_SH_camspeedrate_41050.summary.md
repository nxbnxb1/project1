# DART ablation summary

Sweep: camspeedrate = 41050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.85 (0.47) | 66.33 (13.27) | 5.65 (1.02) | 128 (56) | 2.05 (0.42) | 620.4 (267.8) | 26.4 (0.8) | 15.8 (1.8) | 2.67 (0.16) | 46% | 1.94 (0.45) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.87 (0.41) | 65.90 (14.50) | 5.61 (0.83) | 192 (42) | 2.91 (0.05) | 923.2 (203.4) | 26.5 (0.7) | 16.8 (1.2) | 2.69 (0.13) | 51% | 2.25 (0.48) |


