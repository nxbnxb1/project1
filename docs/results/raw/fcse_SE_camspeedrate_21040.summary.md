# DART ablation summary

Sweep: camspeedrate = 21040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 2.52 (1.74) | 32.65 (18.16) | 7.11 (2.18) | 77 (96) | 1.73 (1.01) | 92.6 (115.5) | 22.1 (3.0) | 6.1 (4.6) | 1.76 (0.68) | 21% | 3.61 (2.50) |
| FR_SAFE | 30 | 90% [74, 97] | 10% [3, 26] | 2.29 (1.78) | 31.64 (15.80) | 7.34 (1.92) | 126 (63) | 4.02 (0.02) | 150.3 (73.7) | 22.1 (2.9) | 6.4 (4.5) | 1.74 (0.65) | 23% | 3.92 (2.52) |


