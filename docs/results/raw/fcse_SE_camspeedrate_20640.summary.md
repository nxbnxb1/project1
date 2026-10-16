# DART ablation summary

Sweep: camspeedrate = 20640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.85 (1.04) | 55.16 (32.74) | 4.80 (1.22) | 107 (138) | 1.41 (1.06) | 128.0 (167.0) | 18.5 (4.6) | 4.1 (3.2) | 1.28 (0.82) | 15% | 3.39 (2.21) |
| FR_SAFE | 30 | 97% [83, 99] | 0% [0, 11] | 2.33 (1.21) | 46.40 (23.13) | 5.00 (1.22) | 189 (93) | 4.01 (0.01) | 226.9 (109.9) | 19.1 (4.8) | 4.8 (3.2) | 1.39 (0.85) | 12% | 4.22 (2.71) |


