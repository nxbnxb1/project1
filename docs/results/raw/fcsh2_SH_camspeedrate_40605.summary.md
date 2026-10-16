# DART ablation summary

Sweep: camspeedrate = 40605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 33% [15, 58] | 0.41 (0.45) | 169.28 (90.33) | 3.39 (1.12) | 62 (46) | 0.48 (0.04) | 297.4 (224.6) | 24.7 (2.0) | 10.0 (2.2) | 2.38 (0.37) | 42% | 1.82 (0.47) |
| FR_SAFE | 15 | 53% [30, 75] | 33% [15, 58] | 0.38 (0.47) | 165.79 (37.40) | 3.07 (1.18) | 64 (34) | 0.51 (0.02) | 308.3 (167.0) | 25.2 (1.9) | 9.9 (1.9) | 2.47 (0.35) | 43% | 2.11 (0.77) |


