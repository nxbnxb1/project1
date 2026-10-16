# DART ablation summary

Sweep: camspeedrate = 20615

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 73% [56, 86] | 17% [7, 34] | 0.94 (0.89) | 81.89 (37.28) | 4.40 (1.36) | 80 (66) | 0.84 (0.30) | 96.3 (79.2) | 18.2 (2.4) | 4.8 (2.2) | 1.23 (0.46) | 17% | 2.60 (0.95) |
| FR_SAFE | 30 | 80% [63, 90] | 17% [7, 34] | 1.02 (0.87) | 77.15 (29.34) | 4.55 (1.13) | 117 (45) | 1.50 (0.00) | 140.1 (54.4) | 19.2 (2.9) | 5.6 (2.5) | 1.39 (0.53) | 19% | 2.83 (0.89) |


