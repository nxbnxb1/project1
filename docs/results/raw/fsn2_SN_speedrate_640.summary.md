# DART ablation summary

Sweep: speedrate = 640

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.10 (0.54) | 61.95 (13.53) | 5.35 (0.50) | 115 (54) | 1.98 (0.71) | 136.5 (63.1) | 18.7 (2.8) | 7.7 (3.3) | 1.27 (0.48) | 9% | 2.37 (0.73) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.00 (0.40) | 60.82 (8.47) | 5.39 (0.47) | 244 (34) | 4.01 (0.00) | 290.4 (38.9) | 18.6 (2.5) | 7.7 (3.2) | 1.24 (0.44) | 10% | 2.92 (0.81) |
| E_DART | 20 | 90% [70, 97] | 10% [3, 30] | 0.97 (0.51) | 59.79 (8.62) | 5.40 (0.47) | 95 (37) | 1.59 (0.34) | 113.2 (44.8) | 18.5 (2.6) | 7.0 (3.3) | 1.22 (0.46) | 10% | 2.05 (0.69) |


