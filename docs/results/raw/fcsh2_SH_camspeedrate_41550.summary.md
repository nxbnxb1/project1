# DART ablation summary

Sweep: camspeedrate = 41550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.68 (0.53) | 76.85 (18.09) | 4.79 (1.15) | 153 (49) | 2.25 (0.35) | 734.2 (236.5) | 26.6 (1.2) | 12.2 (1.1) | 2.72 (0.21) | 52% | 2.18 (0.50) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.98 (0.44) | 66.89 (16.45) | 5.56 (0.94) | 194 (47) | 2.92 (0.04) | 929.0 (224.0) | 26.6 (0.6) | 12.4 (0.7) | 2.70 (0.13) | 53% | 2.41 (0.58) |


