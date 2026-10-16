# DART ablation summary

Sweep: camspeedrate = 41525

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 97% [83, 99] | 3% [1, 17] | 1.42 (1.07) | 40.97 (10.45) | 8.43 (1.52) | 66 (23) | 1.62 (0.18) | 316.8 (114.8) | 24.6 (1.0) | 9.7 (2.9) | 2.25 (0.22) | 33% | 2.60 (1.03) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.35 (0.96) | 44.09 (18.04) | 8.07 (1.98) | 109 (44) | 2.44 (0.02) | 519.8 (208.5) | 24.9 (1.4) | 10.4 (3.8) | 2.29 (0.31) | 38% | 2.49 (0.84) |


