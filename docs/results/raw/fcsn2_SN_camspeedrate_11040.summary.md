# DART ablation summary

Sweep: camspeedrate = 11040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.41 (0.97) | 55.79 (32.44) | 6.96 (1.78) | 129 (122) | 2.12 (0.66) | 158.7 (150.4) | 22.7 (1.4) | 6.1 (2.1) | 1.86 (0.33) | 24% | 2.37 (0.71) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 1.20 (0.85) | 54.01 (20.79) | 6.82 (1.84) | 202 (90) | 4.01 (0.01) | 248.7 (112.7) | 22.8 (1.7) | 6.9 (2.2) | 1.89 (0.37) | 28% | 2.74 (1.14) |


