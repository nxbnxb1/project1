# Ablation Simulink — 50 seed × 8 biến thể × 3 kịch bản (commit `a636d14`)

* Nguồn: workflow **Experiments**, run [37486167304](https://github.com/nxbnxb1/project1/actions/runs/37486167304) (7 biến thể A–G) và run [37487736273](https://github.com/nxbnxb1/project1/actions/runs/37487736273) (`Z_ZHUYI`, commit `39efae9`: chỉ thêm biến thể, đường code của các biến thể khác không đổi). Engine `simulink`, MATLAB R2024b. Seed 1–50.
* Dữ liệu thô: [`raw/ablation_simulink_s50_*.log`](raw/) (một dòng mỗi lượt, lấy nguyên từ log CI); bảng sinh bằng `python3 parse_ablation.py raw/ablation_simulink_s50_*.log`.
* Code tại thời điểm chạy: tracker hai mô hình (tĩnh/động), CBF có slack mặt đất riêng + giới hạn chuyển động mù. Tỉ lệ kèm khoảng tin cậy Wilson 95%. `clr` = khoảng cách thật nhỏ nhất từ thân UAV (bán kính 0.25 m) tới bề mặt vật cản; thời gian và số suy luận chỉ tính trên các lượt về đích.

### S1

| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] | t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|
| A_FR_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.24 | 0.43 ± 0.06 | 13.7 ± 0.3 | 128 ± 3 | 9.33 | 20.0 | 4.2 |
| B_AP_FN | 49/50 (98%) [90, 100] | 0/50 (0%) [0, 7] | 1 | 0.28 | 0.43 ± 0.06 | 13.9 ± 1.3 | 96 ± 16 | 6.81 | 20.0 | 4.3 |
| C_FR_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.24 | 0.44 ± 0.07 | 13.8 ± 0.4 | 129 ± 4 | 9.33 | 25.1 | 5.8 |
| D_AP_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.13 | 0.42 ± 0.08 | 13.9 ± 0.5 | 95 ± 8 | 6.86 | 25.2 | 5.9 |
| **E_DART** | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.25 | 0.57 ± 0.07 | 15.3 ± 2.5 | 98 ± 14 | 6.45 | 25.2 | 6.2 |
| F_NODELAY | 40/50 (80%) [67, 89] | 7/50 (14%) [7, 26] | 3 | -0.03 | 0.30 ± 0.22 | 22.4 ± 5.0 | 179 ± 41 | 8.13 | 25.3 | 7.2 |
| G_FR_LOW | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.34 | 0.59 ± 0.08 | 15.3 ± 1.3 | 45 ± 4 | 2.97 | 25.5 | 6.4 |
| Z_ZHUYI | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.37 | 0.57 ± 0.07 | 17.5 ± 3.9 | 56 ± 7 | 3.32 | 25.0 | 5.0 |

### S2

| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] | t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|
| A_FR_FN | 48/50 (96%) [87, 99] | 2/50 (4%) [1, 13] | 0 | -0.00 | 0.31 ± 0.15 | 16.5 ± 3.8 | 153 ± 35 | 9.31 | 20.0 | 3.1 |
| B_AP_FN | 45/50 (90%) [79, 96] | 5/50 (10%) [4, 21] | 0 | -0.03 | 0.30 ± 0.15 | 16.6 ± 3.6 | 115 ± 13 | 7.11 | 20.0 | 3.2 |
| C_FR_AN | 46/50 (92%) [81, 97] | 4/50 (8%) [3, 19] | 0 | -0.01 | 0.30 ± 0.16 | 15.5 ± 1.4 | 145 ± 13 | 9.34 | 25.0 | 4.6 |
| D_AP_AN | 49/50 (98%) [90, 100] | 1/50 (2%) [0, 10] | 0 | -0.00 | 0.33 ± 0.15 | 15.7 ± 1.8 | 111 ± 10 | 7.18 | 25.0 | 4.5 |
| **E_DART** | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.39 | 0.63 ± 0.11 | 16.7 ± 2.3 | 108 ± 16 | 6.49 | 23.9 | 4.6 |
| F_NODELAY | 40/50 (80%) [67, 89] | 9/50 (18%) [10, 31] | 1 | -0.02 | 0.60 ± 0.55 | 20.0 ± 5.1 | 133 ± 45 | 7.09 | 22.9 | 4.5 |
| G_FR_LOW | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.30 | 0.67 ± 0.19 | 16.4 ± 1.9 | 49 ± 6 | 2.97 | 24.2 | 4.9 |
| Z_ZHUYI | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.20 | 0.76 ± 0.40 | 17.3 ± 2.1 | 37 ± 13 | 2.15 | 23.5 | 4.5 |

### S3

| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] | t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|
| A_FR_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.21 | 0.43 ± 0.08 | 14.2 ± 2.8 | 80 ± 15 | 5.62 | 20.0 | 3.2 |
| B_AP_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.22 | 0.44 ± 0.08 | 13.8 ± 0.9 | 67 ± 3 | 4.84 | 20.0 | 3.2 |
| C_FR_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.29 | 0.45 ± 0.06 | 13.9 ± 0.3 | 78 ± 3 | 5.62 | 25.5 | 4.5 |
| D_AP_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.26 | 0.43 ± 0.06 | 13.9 ± 0.3 | 67 ± 3 | 4.85 | 25.6 | 4.5 |
| **E_DART** | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.38 | 0.60 ± 0.08 | 17.3 ± 3.4 | 79 ± 11 | 4.62 | 25.2 | 5.0 |
| F_NODELAY | 24/50 (48%) [35, 61] | 22/50 (44%) [31, 58] | 4 | -0.03 | 0.20 ± 0.26 | 26.1 ± 6.5 | 131 ± 37 | 5.23 | 25.0 | 5.7 |
| G_FR_LOW | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.37 | 0.63 ± 0.09 | 17.9 ± 3.6 | 53 ± 11 | 2.96 | 25.4 | 5.3 |
| Z_ZHUYI | 44/50 (88%) [76, 94] | 1/50 (2%) [0, 10] | 5 | -0.00 | 0.60 ± 0.12 | 20.3 ± 4.2 | 50 ± 6 | 2.43 | 23.9 | 4.0 |

## Nhận xét (trung thực)

1. **Bù trễ là bắt buộc.** Bỏ bù trễ (F_NODELAY) gây va chạm ở cả ba kịch bản: 7/50, 9/50, 22/50 (S3: 44% [31, 58]).
2. **Lớp an toàn (inflation + braking-CBF + emergency) cùng tracker có bộ nhớ vật cản tĩnh loại bỏ va chạm.** E_DART 0/150 va chạm, 150/150 về đích, clearance nhỏ nhất 0.25 m (S1). Ở S2 (vật cản động), các biến thể không có lớp an toàn (A–D) có 1–5/50 va chạm.
3. **Lập lịch thích nghi chưa cho thấy lợi ích so với tần số thấp cố định có cùng lớp an toàn.** G_FR_LOW (3 Hz) cũng 0/150 va chạm, thời gian tương đương, nhưng dùng **ít suy luận hơn** E_DART (45 so với 98 ở S1; 49 so với 108 ở S2; 53 so với 79 ở S3). Lợi thế duy nhất của E so với perception 10 Hz cố định là giảm suy luận (S1: 98 so với 128 của A).
4. **Thành phần bất định + frontier của scheduler (E so với Z_ZHUYI).** Z_ZHUYI dùng ít suy luận hơn E nhưng ở S3 (trễ 160 ms, nhiễu lớn) có 1/50 va chạm và 5/50 timeout, so với 0 và 0 của E_DART. Bằng chứng có lợi nhưng yếu (khoảng tin cậy va chạm còn chồng nhau).
5. **Horizon thích nghi** (C so với A, D so với B) vẫn chưa cho lợi ích an toàn rõ ràng.

Hệ quả cho bài báo: với các thiết lập hiện tại (3 m/s), đóng góp "lập lịch perception theo an toàn" **chưa được chứng minh** bằng thực nghiệm. Đang chờ quét tốc độ (3–6 m/s) để kiểm tra giả thuyết rằng một tần số cố định thấp sẽ thất bại khi tốc độ/độ trễ tăng, còn scheduler thích nghi thì không.
