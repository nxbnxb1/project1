# DART ablation summary

Sweep: camspeedrate = 20605

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SN

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 30 | 60% [42, 75] | 33% [19, 51] | 0.69 (0.83) | 67.17 (15.48) | 4.62 (1.21) | 26 (13) | 0.39 (0.07) | 30.9 (15.2) | 17.9 (2.4) | 5.2 (2.3) | 1.18 (0.44) | 18% | 2.27 (0.88) |
| FR_SAFE | 30 | 53% [36, 70] | 43% [27, 61] | 0.53 (0.64) | 86.10 (34.25) | 4.28 (1.44) | 36 (18) | 0.51 (0.02) | 42.5 (21.9) | 18.4 (2.8) | 6.0 (3.1) | 1.26 (0.51) | 20% | 2.69 (1.37) |


