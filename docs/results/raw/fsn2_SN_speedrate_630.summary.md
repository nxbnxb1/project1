# DART ablation summary

Sweep: speedrate = 630

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 20 | 95% [76, 99] | 5% [1, 24] | 1.02 (0.36) | 61.62 (13.09) | 5.28 (0.56) | 95 (46) | 1.48 (0.46) | 113.1 (53.3) | 18.8 (2.8) | 5.3 (2.5) | 1.28 (0.48) | 10% | 2.56 (0.84) |
| FR_SAFE | 20 | 100% [84, 100] | 0% [0, 16] | 1.11 (0.35) | 60.52 (8.73) | 5.38 (0.45) | 178 (26) | 2.95 (0.01) | 212.0 (31.4) | 18.5 (2.6) | 5.3 (2.3) | 1.22 (0.46) | 10% | 2.56 (0.81) |
| E_DART | 20 | 100% [84, 100] | 0% [0, 16] | 1.09 (0.40) | 60.58 (7.46) | 5.36 (0.39) | 86 (22) | 1.40 (0.20) | 102.0 (25.5) | 18.1 (2.3) | 4.8 (2.1) | 1.16 (0.40) | 9% | 2.04 (0.71) |


