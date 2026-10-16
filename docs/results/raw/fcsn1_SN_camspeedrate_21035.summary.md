# DART ablation summary

Sweep: camspeedrate = 21035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 1.42 (0.89) | 50.72 (19.89) | 7.01 (1.70) | 100 (64) | 1.85 (0.53) | 119.6 (77.2) | 22.6 (1.7) | 4.6 (1.9) | 1.82 (0.39) | 26% | 2.54 (0.67) |
| FR_SAFE | 30 | 93% [79, 98] | 7% [2, 21] | 1.23 (0.81) | 45.46 (13.38) | 7.54 (1.44) | 153 (48) | 3.46 (0.01) | 183.1 (56.3) | 22.8 (1.6) | 4.9 (2.0) | 1.84 (0.38) | 25% | 3.06 (0.83) |


