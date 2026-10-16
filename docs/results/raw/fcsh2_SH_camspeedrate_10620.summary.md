# DART ablation summary

Sweep: camspeedrate = 10620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 67% [42, 85] | 27% [11, 52] | 0.42 (0.42) | 155.16 (45.78) | 2.93 (1.15) | 204 (118) | 1.47 (0.43) | 250.6 (144.9) | 23.2 (2.4) | 12.7 (2.7) | 2.14 (0.43) | 40% | 2.10 (0.57) |
| FR_SAFE | 15 | 53% [30, 75] | 33% [15, 58] | 0.67 (0.55) | 164.22 (56.67) | 2.65 (0.87) | 229 (143) | 2.01 (0.01) | 280.3 (174.0) | 22.3 (3.2) | 13.2 (2.6) | 2.00 (0.51) | 37% | 2.47 (0.81) |


