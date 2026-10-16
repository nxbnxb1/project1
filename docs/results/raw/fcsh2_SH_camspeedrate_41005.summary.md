# DART ablation summary

Sweep: camspeedrate = 41005

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 40% [20, 64] | 60% [36, 80] | 0.14 (0.27) | 102.26 (29.15) | 4.57 (1.53) | 34 (21) | 0.49 (0.03) | 164.2 (100.6) | 25.1 (1.4) | 13.0 (2.4) | 2.44 (0.27) | 46% | 1.69 (0.40) |
| FR_SAFE | 15 | 13% [4, 38] | 73% [48, 89] | 0.23 (0.44) | 172.62 (17.71) | 4.10 (1.71) | 35 (26) | 0.51 (0.01) | 169.6 (127.8) | 25.4 (1.3) | 13.5 (2.4) | 2.48 (0.25) | 47% | 1.86 (0.46) |


