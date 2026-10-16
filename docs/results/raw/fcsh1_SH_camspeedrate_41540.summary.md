# DART ablation summary

Sweep: camspeedrate = 41540

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 93% [70, 99] | 7% [1, 30] | 0.73 (0.37) | 72.59 (11.84) | 5.24 (0.83) | 147 (44) | 2.08 (0.29) | 709.8 (211.9) | 26.6 (0.8) | 16.4 (1.5) | 2.70 (0.16) | 50% | 2.14 (0.39) |
| FR_SAFE | 15 | 100% [80, 100] | 0% [0, 20] | 0.95 (0.33) | 65.33 (11.30) | 5.68 (0.83) | 189 (32) | 2.90 (0.04) | 910.3 (156.8) | 26.3 (0.9) | 16.6 (1.0) | 2.65 (0.17) | 51% | 2.22 (0.40) |


