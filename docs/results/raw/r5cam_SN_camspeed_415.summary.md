# DART ablation summary

Sweep: camspeed = 415

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 33% [15, 58] | 1.51 (1.71) | 37.42 (12.47) | 9.02 (1.99) | 51 (27) | 1.55 (0.30) | 241.2 (130.5) | 23.7 (0.8) | 4.0 (1.3) | 2.06 (0.15) | 27% | 3.38 (1.23) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 7% [1, 30] | 1.77 (1.11) | 47.12 (16.96) | 8.05 (1.99) | 125 (44) | 2.70 (0.03) | 602.5 (217.7) | 23.4 (1.8) | 4.4 (1.2) | 2.05 (0.30) | 33% | 3.05 (1.29) |


