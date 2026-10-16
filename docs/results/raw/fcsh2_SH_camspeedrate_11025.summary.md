# DART ablation summary

Sweep: camspeedrate = 11025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 7% [1, 30] | 0.59 (0.38) | 96.70 (35.18) | 4.03 (1.36) | 220 (141) | 1.90 (0.33) | 270.3 (174.2) | 24.4 (1.1) | 12.9 (1.7) | 2.34 (0.16) | 47% | 2.06 (0.38) |
| FR_SAFE | 15 | 67% [42, 85] | 33% [15, 58] | 0.57 (0.56) | 105.14 (31.19) | 4.03 (1.19) | 221 (102) | 2.51 (0.01) | 270.0 (125.2) | 24.6 (1.3) | 13.8 (1.4) | 2.39 (0.21) | 47% | 2.19 (0.44) |


