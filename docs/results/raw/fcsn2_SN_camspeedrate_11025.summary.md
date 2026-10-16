# DART ablation summary

Sweep: camspeedrate = 11025

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 80% [63, 90] | 17% [7, 34] | 1.18 (0.93) | 59.77 (25.95) | 6.20 (2.28) | 100 (64) | 1.60 (0.45) | 122.1 (77.6) | 22.5 (1.7) | 6.2 (2.3) | 1.85 (0.39) | 27% | 2.47 (0.94) |
| FR_SAFE | 30 | 97% [83, 99] | 3% [1, 17] | 1.21 (1.11) | 60.25 (32.25) | 6.63 (1.89) | 148 (81) | 2.51 (0.01) | 181.9 (101.3) | 22.9 (1.4) | 6.4 (2.2) | 1.90 (0.35) | 31% | 2.59 (0.95) |


