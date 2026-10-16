# DART ablation summary

Sweep: camspeedrate = 21530

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 90% [74, 97] | 10% [3, 26] | 1.03 (0.79) | 49.67 (18.48) | 7.20 (1.63) | 87 (55) | 1.68 (0.43) | 104.9 (66.1) | 22.5 (1.8) | 5.6 (2.4) | 1.80 (0.40) | 27% | 2.60 (0.67) |
| FR_SAFE | 30 | 87% [70, 95] | 13% [5, 30] | 1.00 (0.72) | 48.20 (17.09) | 7.30 (1.69) | 133 (55) | 2.96 (0.01) | 159.2 (66.4) | 22.6 (1.7) | 5.8 (2.3) | 1.82 (0.39) | 28% | 2.77 (0.84) |


