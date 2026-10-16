# DART ablation summary

Sweep: camspeedrate = 21020

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 83% [66, 93] | 13% [5, 30] | 0.97 (0.79) | 55.74 (29.47) | 6.76 (2.09) | 77 (66) | 1.32 (0.35) | 92.0 (78.9) | 22.3 (1.4) | 7.4 (3.1) | 1.78 (0.35) | 25% | 2.46 (0.66) |
| FR_SAFE | 30 | 80% [63, 90] | 17% [7, 34] | 0.94 (0.74) | 51.90 (22.53) | 6.92 (1.96) | 104 (44) | 2.01 (0.01) | 124.2 (53.2) | 22.4 (1.6) | 7.6 (2.9) | 1.80 (0.36) | 27% | 2.66 (0.89) |


