# DART ablation summary

Sweep: speedrate = 1040

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 10 | 90% [60, 98] | 10% [2, 40] | 0.69 (0.38) | 63.60 (13.32) | 5.66 (0.90) | 157 (64) | 2.83 (0.81) | 190.4 (77.0) | 26.3 (0.6) | 16.2 (0.9) | 2.64 (0.11) | 42% | 2.06 (0.33) |
| FR_SAFE | 10 | 100% [72, 100] | 0% [0, 28] | 0.83 (0.30) | 59.48 (13.65) | 5.87 (1.00) | 238 (55) | 4.01 (0.01) | 286.9 (66.7) | 26.7 (0.5) | 17.1 (0.6) | 2.72 (0.09) | 48% | 2.25 (0.47) |
| E_DART | 10 | 90% [60, 98] | 10% [2, 40] | 0.87 (0.35) | 62.81 (16.17) | 5.46 (1.24) | 175 (45) | 2.81 (0.18) | 211.4 (53.7) | 26.4 (0.7) | 16.7 (0.7) | 2.67 (0.11) | 49% | 2.06 (0.65) |


