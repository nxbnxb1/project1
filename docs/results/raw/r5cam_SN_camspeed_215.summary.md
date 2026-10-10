# DART ablation summary

Sweep: camspeed = 215

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 27% [11, 52] | 0.61 (0.63) | 46.48 (22.54) | 7.87 (2.24) | 319 (409) | 6.04 (1.20) | 383.9 (489.3) | 21.9 (2.2) | 4.9 (2.4) | 1.64 (0.45) | 23% | 4.05 (2.35) |
| FR_SAFE_3 | 15 | 93% [70, 99] | 0% [0, 20] | 1.54 (0.89) | 49.43 (13.90) | 7.13 (1.73) | 153 (48) | 2.95 (0.01) | 183.8 (56.2) | 21.0 (1.9) | 4.3 (1.3) | 1.54 (0.33) | 25% | 2.97 (1.24) |


