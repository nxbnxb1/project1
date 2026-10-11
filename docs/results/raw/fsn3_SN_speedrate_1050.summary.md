# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.15 (0.77) | 42.10 (6.56) | 7.77 (0.92) | 121 (39) | 2.91 (0.67) | 145.7 (47.4) | 23.6 (1.5) | 10.4 (3.0) | 1.99 (0.34) | 25% | 2.92 (1.11) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.10 (0.53) | 42.24 (9.71) | 7.75 (1.15) | 212 (48) | 5.01 (0.01) | 254.4 (58.8) | 23.6 (1.6) | 10.9 (3.2) | 1.98 (0.37) | 28% | 2.84 (1.01) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.05 (0.92) | 42.92 (8.02) | 7.74 (1.02) | 106 (35) | 2.49 (0.38) | 127.8 (43.3) | 23.6 (1.3) | 10.0 (2.8) | 1.98 (0.30) | 26% | 2.67 (1.02) |


