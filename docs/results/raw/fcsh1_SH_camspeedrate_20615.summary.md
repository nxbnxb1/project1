# DART ablation summary

Sweep: camspeedrate = 20615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 0.38 (0.36) | 178.83 (63.57) | 2.88 (0.86) | 166 (108) | 1.20 (0.18) | 200.4 (129.2) | 22.4 (2.0) | 11.1 (2.7) | 2.01 (0.33) | 40% | 2.34 (0.53) |
| FR_SAFE | 15 | 67% [42, 85] | 20% [7, 45] | 0.58 (0.52) | 148.92 (62.62) | 2.90 (0.97) | 205 (93) | 1.50 (0.00) | 247.1 (111.9) | 23.3 (2.1) | 12.8 (1.6) | 2.16 (0.33) | 37% | 2.22 (0.43) |


