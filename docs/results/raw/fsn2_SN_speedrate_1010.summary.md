# DART ablation summary

Sweep: speedrate = 1010

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.49 (0.74) | 47.84 (24.38) | 7.27 (2.03) | 38 (24) | 0.80 (0.08) | 45.3 (27.4) | 23.1 (1.9) | 8.5 (3.9) | 1.90 (0.44) | 24% | 2.05 (0.63) |
| FR_SAFE | 20 | 90% [70, 97] | 10% [3, 30] | 1.10 (0.65) | 50.12 (19.89) | 7.43 (1.90) | 48 (21) | 1.01 (0.01) | 56.8 (23.8) | 23.3 (1.8) | 8.4 (3.9) | 1.94 (0.42) | 27% | 2.18 (0.57) |
| E_DART | 20 | 95% [76, 99] | 0% [0, 16] | 1.49 (0.68) | 46.90 (9.81) | 7.05 (1.54) | 50 (16) | 1.01 (0.01) | 59.2 (18.1) | 22.9 (1.9) | 8.3 (3.5) | 1.88 (0.41) | 28% | 2.06 (0.74) |


