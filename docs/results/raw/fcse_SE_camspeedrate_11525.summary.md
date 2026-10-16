# DART ablation summary

Sweep: camspeedrate = 11525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.74 (1.73) | 33.37 (20.72) | 7.87 (2.54) | 53 (50) | 1.28 (0.50) | 64.4 (61.5) | 22.2 (1.5) | 7.4 (5.4) | 1.77 (0.39) | 24% | 3.98 (2.79) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.62 (1.98) | 35.39 (26.37) | 7.78 (2.79) | 86 (63) | 2.52 (0.01) | 105.3 (77.8) | 22.9 (2.3) | 8.4 (6.7) | 1.91 (0.54) | 28% | 3.74 (2.71) |


