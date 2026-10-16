# DART ablation summary

Sweep: camspeedrate = 40620

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 80% [55, 93] | 13% [4, 38] | 0.61 (0.37) | 101.39 (24.30) | 3.96 (0.83) | 148 (51) | 1.48 (0.23) | 715.1 (249.4) | 25.5 (1.1) | 11.6 (1.1) | 2.49 (0.20) | 34% | 2.22 (0.39) |
| FR_SAFE | 15 | 67% [42, 85] | 27% [11, 52] | 0.83 (0.59) | 95.82 (16.61) | 3.97 (0.99) | 153 (67) | 2.00 (0.01) | 740.9 (326.6) | 24.9 (1.6) | 11.8 (1.2) | 2.38 (0.29) | 34% | 2.20 (0.35) |


