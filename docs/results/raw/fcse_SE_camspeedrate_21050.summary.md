# DART ablation summary

Sweep: camspeedrate = 21050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.32 (1.84) | 35.05 (24.25) | 7.26 (2.04) | 81 (114) | 1.88 (1.10) | 95.9 (135.0) | 21.4 (2.4) | 4.0 (2.7) | 1.61 (0.55) | 19% | 3.43 (2.31) |
| FR_SAFE | 30 | 90% [74, 97] | 7% [2, 21] | 2.54 (1.67) | 29.58 (12.76) | 7.38 (2.11) | 161 (95) | 5.03 (0.02) | 192.8 (111.8) | 22.1 (2.9) | 4.6 (3.3) | 1.74 (0.67) | 23% | 3.69 (2.33) |


