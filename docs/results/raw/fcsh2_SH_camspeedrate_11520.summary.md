# DART ablation summary

Sweep: camspeedrate = 11520

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 47% [25, 70] | 53% [30, 75] | 0.33 (0.44) | 105.76 (28.51) | 4.54 (1.57) | 123 (79) | 1.63 (0.18) | 151.3 (97.2) | 24.3 (1.9) | 6.4 (1.1) | 2.30 (0.33) | 48% | 2.25 (0.53) |
| FR_SAFE | 15 | 73% [48, 89] | 27% [11, 52] | 0.54 (0.52) | 104.24 (32.93) | 3.84 (0.82) | 193 (69) | 2.01 (0.00) | 235.8 (85.9) | 25.1 (1.6) | 7.8 (0.8) | 2.48 (0.26) | 50% | 2.11 (0.53) |


