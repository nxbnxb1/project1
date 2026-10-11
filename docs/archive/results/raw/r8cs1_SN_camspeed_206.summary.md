# DART ablation summary

Sweep: camspeed = 206

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 0% [0, 11] | 1.51 (0.65) | 83.39 (31.53) | 4.42 (1.27) | 88 (45) | 1.01 (0.34) | 106.1 (53.9) | 17.2 (2.0) | 2.2 (0.7) | 1.06 (0.33) | 18% | 2.79 (0.89) |
| FR_SAFE_3 | 30 | 90% [74, 97] | 0% [0, 11] | 2.02 (0.74) | 76.02 (25.33) | 4.69 (1.03) | 242 (93) | 2.95 (0.00) | 290.4 (109.9) | 18.1 (2.3) | 2.5 (0.9) | 1.19 (0.41) | 18% | 3.27 (0.85) |


