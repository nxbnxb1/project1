# DART ablation summary

Sweep: camspeedrate = 40635

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 87% [62, 96] | 13% [4, 38] | 0.66 (0.44) | 90.88 (20.18) | 4.22 (0.59) | 163 (74) | 1.88 (0.41) | 784.1 (354.4) | 25.3 (0.5) | 7.9 (0.5) | 2.44 (0.10) | 31% | 2.06 (0.33) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.60 (0.50) | 89.88 (24.49) | 4.19 (0.64) | 226 (92) | 2.85 (0.04) | 1087.6 (444.6) | 25.5 (1.0) | 8.4 (0.7) | 2.47 (0.20) | 31% | 2.35 (0.37) |


