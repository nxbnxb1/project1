# DART ablation summary

Sweep: camspeed = 206

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 3% [1, 17] | 1.50 (0.57) | 92.23 (39.51) | 4.14 (1.39) | 101 (53) | 1.03 (0.32) | 121.8 (63.2) | 17.2 (2.0) | 2.3 (0.7) | 1.08 (0.35) | 18% | 2.76 (0.86) |
| FR_SAFE_3 | 30 | 87% [70, 95] | 0% [0, 11] | 1.86 (0.86) | 80.32 (23.33) | 4.41 (1.27) | 241 (68) | 2.95 (0.00) | 288.6 (81.8) | 18.7 (2.6) | 2.7 (0.9) | 1.32 (0.45) | 21% | 3.12 (1.16) |


