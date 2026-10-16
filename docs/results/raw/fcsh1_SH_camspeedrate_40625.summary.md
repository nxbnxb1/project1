# DART ablation summary

Sweep: camspeedrate = 40625

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 73% [48, 89] | 27% [11, 52] | 0.74 (0.58) | 93.18 (25.67) | 4.29 (0.58) | 144 (59) | 1.69 (0.30) | 693.2 (280.4) | 25.4 (1.1) | 8.3 (1.0) | 2.45 (0.20) | 32% | 2.11 (0.33) |
| FR_SAFE | 15 | 93% [70, 99] | 7% [1, 30] | 0.81 (0.39) | 84.05 (13.31) | 4.40 (0.52) | 193 (51) | 2.43 (0.02) | 934.4 (244.9) | 25.5 (0.8) | 8.8 (0.6) | 2.47 (0.17) | 31% | 2.16 (0.42) |


