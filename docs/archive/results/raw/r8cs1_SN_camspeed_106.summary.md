# DART ablation summary

Sweep: camspeed = 106

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 87% [70, 95] | 0% [0, 11] | 1.63 (0.71) | 84.57 (33.94) | 4.31 (1.40) | 86 (46) | 0.98 (0.35) | 104.8 (55.6) | 16.9 (2.3) | 3.9 (1.2) | 1.03 (0.36) | 16% | 2.72 (0.93) |
| FR_SAFE_3 | 30 | 97% [83, 99] | 3% [1, 17] | 1.68 (0.78) | 80.57 (30.16) | 4.77 (0.98) | 236 (88) | 2.95 (0.01) | 287.8 (106.3) | 18.1 (2.3) | 4.4 (1.5) | 1.19 (0.41) | 17% | 3.27 (0.93) |


