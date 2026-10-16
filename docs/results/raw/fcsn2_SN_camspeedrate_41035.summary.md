# DART ablation summary

Sweep: camspeedrate = 41035

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 100% [89, 100] | 0% [0, 11] | 1.25 (0.65) | 45.95 (13.05) | 7.47 (1.34) | 78 (39) | 1.62 (0.38) | 373.9 (186.1) | 23.4 (1.6) | 9.3 (3.0) | 1.97 (0.35) | 27% | 2.40 (0.74) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.25 (0.76) | 44.95 (12.93) | 7.49 (1.35) | 129 (37) | 2.85 (0.05) | 621.1 (176.9) | 23.4 (1.8) | 9.7 (3.6) | 1.96 (0.41) | 28% | 2.39 (0.74) |


