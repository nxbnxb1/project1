# DART ablation summary

Sweep: speedrate = 610

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.30 (0.63) | 74.52 (39.05) | 4.88 (0.98) | 54 (41) | 0.67 (0.15) | 64.5 (48.7) | 19.2 (3.3) | 4.4 (2.3) | 1.38 (0.59) | 15% | 2.35 (0.61) |
| FR_SAFE | 20 | 85% [64, 95] | 5% [1, 24] | 1.12 (0.55) | 78.34 (28.11) | 4.44 (1.27) | 80 (30) | 1.01 (0.01) | 96.1 (35.5) | 19.8 (4.0) | 5.0 (2.7) | 1.49 (0.71) | 21% | 2.84 (1.21) |
| E_DART | 20 | 95% [76, 99] | 5% [1, 24] | 1.15 (0.48) | 77.40 (29.60) | 4.82 (1.02) | 76 (31) | 1.01 (0.01) | 91.2 (35.9) | 19.6 (3.8) | 4.5 (2.5) | 1.45 (0.68) | 18% | 2.70 (1.13) |


