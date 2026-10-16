# DART ablation summary

Sweep: camspeedrate = 10640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 2.16 (1.42) | 57.49 (44.01) | 4.81 (1.35) | 119 (174) | 1.40 (1.05) | 146.2 (213.7) | 19.0 (4.6) | 8.1 (5.8) | 1.38 (0.82) | 15% | 3.90 (2.53) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 2.06 (1.16) | 51.92 (38.08) | 4.98 (1.00) | 203 (152) | 4.01 (0.01) | 249.3 (187.8) | 19.1 (4.6) | 8.4 (5.6) | 1.38 (0.82) | 14% | 4.12 (2.50) |


