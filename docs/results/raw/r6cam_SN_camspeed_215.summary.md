# DART ablation summary

Sweep: camspeed = 215

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 1.10 (0.68) | 57.34 (26.97) | 6.83 (2.07) | 84 (45) | 1.45 (0.49) | 100.6 (53.8) | 20.6 (2.3) | 3.1 (1.0) | 1.49 (0.37) | 25% | 2.59 (0.59) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 0% [0, 20] | 1.54 (0.89) | 49.43 (13.90) | 7.13 (1.73) | 153 (48) | 2.95 (0.01) | 183.8 (56.2) | 21.0 (1.9) | 3.2 (0.9) | 1.54 (0.33) | 25% | 2.97 (1.24) |


