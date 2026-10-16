# DART ablation summary

Sweep: camspeedrate = 11550

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SE

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 93% [79, 98] | 7% [2, 21] | 2.64 (1.82) | 31.41 (18.55) | 7.88 (2.49) | 82 (81) | 2.20 (1.11) | 100.4 (100.7) | 22.6 (2.1) | 7.1 (5.3) | 1.86 (0.50) | 25% | 3.84 (2.57) |
| FR_SAFE | 30 | 100% [89, 100] | 0% [0, 11] | 2.58 (1.48) | 30.91 (14.59) | 7.98 (2.26) | 155 (73) | 5.02 (0.01) | 189.7 (90.5) | 22.7 (1.9) | 7.9 (5.0) | 1.89 (0.45) | 27% | 4.23 (2.61) |


