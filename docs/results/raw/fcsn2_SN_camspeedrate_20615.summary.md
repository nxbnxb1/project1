# DART ablation summary

Sweep: camspeedrate = 20615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 1.04 (0.56) | 79.75 (25.26) | 4.25 (1.20) | 77 (45) | 0.89 (0.29) | 92.9 (54.0) | 19.0 (2.5) | 4.0 (1.5) | 1.37 (0.44) | 19% | 2.45 (0.69) |
| FR_SAFE | 30 | 83% [66, 93] | 13% [5, 30] | 1.10 (0.82) | 77.89 (26.85) | 4.58 (1.04) | 113 (53) | 1.50 (0.01) | 136.1 (65.5) | 19.5 (2.6) | 4.4 (1.6) | 1.44 (0.46) | 19% | 2.68 (1.15) |


