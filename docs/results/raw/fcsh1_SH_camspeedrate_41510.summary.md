# DART ablation summary

Sweep: camspeedrate = 41510

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.62 (0.56) | 79.18 (29.64) | 5.22 (1.72) | 57 (37) | 0.89 (0.08) | 270.5 (175.7) | 26.1 (0.8) | 14.3 (2.0) | 2.62 (0.16) | 47% | 1.99 (0.59) |
| FR_SAFE | 15 | 80% [55, 93] | 20% [7, 45] | 0.62 (0.43) | 110.17 (35.51) | 4.30 (1.18) | 95 (45) | 1.01 (0.01) | 458.2 (217.1) | 26.4 (1.1) | 15.6 (1.6) | 2.69 (0.20) | 54% | 1.98 (0.48) |


