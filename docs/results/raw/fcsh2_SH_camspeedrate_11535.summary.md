# DART ablation summary

Sweep: camspeedrate = 11535

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision (no time limit; a run without progress for sim.stuck_window s ends as stuck). Time to goal over successful runs only.

## Scenario SH

| Variant | n | Success | Collision | Min clear [m] | Time to goal [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_COV | 15 | 60% [36, 80] | 33% [15, 58] | 0.45 (0.46) | 92.12 (30.40) | 4.52 (1.21) | 197 (120) | 2.59 (0.48) | 241.5 (146.9) | 24.8 (1.5) | 13.1 (1.7) | 2.41 (0.24) | 50% | 2.44 (0.60) |
| FR_SAFE | 15 | 60% [36, 80] | 40% [20, 64] | 0.52 (0.56) | 83.47 (29.20) | 5.06 (1.56) | 209 (133) | 3.46 (0.02) | 255.7 (162.8) | 24.9 (1.4) | 12.8 (1.7) | 2.41 (0.22) | 48% | 2.06 (0.53) |


