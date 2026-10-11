# DART ablation summary

Sweep: speedrate = 1050

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 100% [84, 100] | 0% [0, 16] | 1.09 (0.49) | 40.26 (7.56) | 8.04 (1.05) | 109 (41) | 2.64 (0.72) | 129.3 (48.2) | 22.8 (1.5) | 8.8 (3.5) | 1.81 (0.36) | 20% | 2.30 (0.67) |
| FR_SAFE | 20 | 95% [76, 99] | 5% [1, 24] | 1.17 (0.48) | 39.93 (5.84) | 7.90 (1.14) | 196 (33) | 5.01 (0.01) | 233.8 (39.6) | 22.7 (1.4) | 9.0 (3.3) | 1.80 (0.33) | 22% | 2.69 (0.69) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.07 (0.47) | 42.40 (10.06) | 7.86 (1.20) | 97 (34) | 2.27 (0.47) | 115.3 (39.9) | 22.4 (1.7) | 8.0 (3.2) | 1.74 (0.35) | 22% | 2.28 (0.82) |


