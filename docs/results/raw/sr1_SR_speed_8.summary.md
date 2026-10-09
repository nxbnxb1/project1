# DART ablation summary

Sweep: speed = 8

Mean (std) over seeds; rates with Wilson 95% interval. Success = goal reached without collision.

## Scenario SR

| Variant | n | Success | Collision | Min clear [m] | Time [s] | Speed [m/s] | Inferences | f_v mean [Hz] | GPU energy [J] | N mean | MPC [ms] | QP cost (rel.) | CBF active | Est. err [m] |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| E_DART | 60 | 65% [52, 76] | 23% [14, 35] | 0.51 (0.45) | 25.53 (9.13) | 3.17 (0.64) | 200 (76) | 7.90 (1.01) | 239.8 (91.9) | 26.2 (1.5) | 6.4 (0.8) | 2.61 (0.29) | 46% | 1.66 (0.48) |


