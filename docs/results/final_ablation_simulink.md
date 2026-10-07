# Ablation Simulink cuối — 50 seed × 8 biến thể × 3 kịch bản (commit `3438b2b`)

* Nguồn: workflow **Experiments**, run [37492148397](https://github.com/nxbnxb1/project1/actions/runs/37492148397), engine `simulink`, MATLAB R2024b, seed 1–50, 1200 lượt.
* Code: tracker hai mô hình; CBF có slack mặt đất riêng + giới hạn chuyển động mù; hộp gia tốc ngang 4.6 m/s² (điều kiện khả thi `a_max ≥ a_b + ā_o + δ_a`); trigger "urgent" chỉ cho vật cản trong FOV; trigger độ bất định có điều kiện lợi ích thông tin.
* Dữ liệu thô: [`raw/final_ablation_simulink_S*.log`](raw/); bảng: `python3 parse_ablation.py raw/final_ablation_simulink_S*.log`. Tỉ lệ kèm khoảng tin cậy Wilson 95%; `clr` là khoảng cách thật nhỏ nhất từ thân UAV tới bề mặt vật cản (biên thiết kế d_s − r_body = 0.25 m).
* Thay thế [`ablation_simulink_s50.md`](ablation_simulink_s50.md) (code trước các sửa lỗi trên).

### S1

| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] | t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|
| A_FR_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.19 | 0.43 ± 0.06 | 13.7 ± 0.3 | 128 ± 3 | 9.32 | 20.0 | 4.1 |
| B_AP_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.15 | 0.42 ± 0.08 | 13.9 ± 1.5 | 77 ± 14 | 5.54 | 20.0 | 4.1 |
| C_FR_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.19 | 0.43 ± 0.07 | 13.9 ± 0.5 | 129 ± 5 | 9.32 | 25.2 | 5.8 |
| D_AP_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.21 | 0.41 ± 0.08 | 13.8 ± 0.3 | 75 ± 6 | 5.46 | 25.5 | 5.8 |
| **E_DART** | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.46 | 0.58 ± 0.07 | 15.0 ± 1.1 | 75 ± 7 | 5.02 | 25.4 | 6.2 |
| F_NODELAY | 39/50 (78%) [65, 87] | 8/50 (16%) [8, 29] | 3 | -0.02 | 0.28 ± 0.22 | 22.0 ± 5.0 | 145 ± 37 | 6.72 | 25.5 | 7.1 |
| G_FR_LOW | 48/50 (96%) [87, 99] | 0/50 (0%) [0, 7] | 2 | 0.32 | 0.59 ± 0.09 | 15.2 ± 1.3 | 45 ± 4 | 2.97 | 25.4 | 6.3 |
| Z_ZHUYI | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.30 | 0.58 ± 0.08 | 17.1 ± 3.5 | 53 ± 7 | 3.20 | 25.0 | 6.3 |

### S2

| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] | t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|
| A_FR_FN | 49/50 (98%) [90, 100] | 1/50 (2%) [0, 10] | 0 | -0.01 | 0.31 ± 0.15 | 15.7 ± 2.1 | 147 ± 19 | 9.32 | 20.0 | 4.1 |
| B_AP_FN | 44/50 (88%) [76, 94] | 6/50 (12%) [6, 24] | 0 | -0.01 | 0.28 ± 0.15 | 16.1 ± 1.8 | 86 ± 11 | 5.53 | 20.0 | 4.1 |
| C_FR_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.02 | 0.29 ± 0.15 | 15.7 ± 1.6 | 146 ± 15 | 9.32 | 25.2 | 6.0 |
| D_AP_AN | 45/50 (90%) [79, 96] | 5/50 (10%) [4, 21] | 0 | -0.02 | 0.27 ± 0.16 | 15.5 ± 2.1 | 83 ± 10 | 5.30 | 25.3 | 6.0 |
| **E_DART** | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.08 | 0.60 ± 0.16 | 16.3 ± 2.0 | 77 ± 14 | 4.79 | 24.5 | 6.2 |
| F_NODELAY | 46/50 (92%) [81, 97] | 4/50 (8%) [3, 19] | 0 | -0.01 | 0.71 ± 0.54 | 19.2 ± 4.7 | 104 ± 45 | 5.60 | 23.4 | 5.9 |
| G_FR_LOW | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.37 | 0.69 ± 0.16 | 16.3 ± 2.0 | 48 ± 6 | 2.97 | 24.5 | 6.2 |
| Z_ZHUYI | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.37 | 0.83 ± 0.46 | 17.2 ± 2.7 | 35 ± 10 | 2.10 | 24.0 | 5.8 |

### S3

| Variant | Success [95% CI] | Collision [95% CI] | Timeout | clr min [m] | clr mean ± sd [m] | t goal [s] | Inferences (goal) | inf/s | N mean | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|
| A_FR_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.19 | 0.43 ± 0.07 | 14.1 ± 2.2 | 79 ± 12 | 5.63 | 20.0 | 3.2 |
| B_AP_FN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.23 | 0.43 ± 0.08 | 14.1 ± 2.4 | 56 ± 3 | 3.99 | 20.0 | 3.3 |
| C_FR_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.21 | 0.44 ± 0.06 | 14.0 ± 0.5 | 78 ± 4 | 5.62 | 25.6 | 4.5 |
| D_AP_AN | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.20 | 0.42 ± 0.07 | 13.9 ± 0.6 | 56 ± 3 | 3.99 | 25.8 | 4.6 |
| **E_DART** | 50/50 (100%) [93, 100] | 0/50 (0%) [0, 7] | 0 | 0.37 | 0.60 ± 0.10 | 17.4 ± 4.1 | 62 ± 9 | 3.64 | 25.4 | 5.0 |
| F_NODELAY | 19/50 (38%) [26, 52] | 22/50 (44%) [31, 58] | 9 | -0.02 | 0.18 ± 0.23 | 26.3 ± 5.1 | 110 ± 26 | 4.37 | 25.0 | 5.3 |
| G_FR_LOW | 48/50 (96%) [87, 99] | 1/50 (2%) [0, 10] | 1 | -0.00 | 0.61 ± 0.13 | 17.8 ± 4.1 | 53 ± 12 | 2.97 | 25.3 | 4.9 |
| Z_ZHUYI | 43/50 (86%) [74, 93] | 0/50 (0%) [0, 7] | 7 | 0.34 | 0.62 ± 0.10 | 20.2 ± 5.6 | 47 ± 5 | 2.31 | 24.0 | 4.5 |

## Kiểm định (Fisher exact, hai phía)

| So sánh | p |
|---|---|
| Thất bại (va chạm + timeout) gộp S1–S3: E_DART 0/150 vs Z_ZHUYI 7/150 | 0.015 |
| Thất bại ở S3: E_DART 0/50 vs Z_ZHUYI 7/50 | 0.013 |
| Thất bại gộp: E_DART 0/150 vs G_FR_LOW (3 Hz) 4/150 | 0.12 (không có ý nghĩa thống kê) |
| Va chạm gộp: E_DART 0/150 vs F_NODELAY 34/150 | < 0.0001 |
| Va chạm S2: E_DART 0/50 vs B_AP_FN 6/50 | 0.027 |
| Va chạm S2: E_DART 0/50 vs D_AP_AN 5/50 | 0.056 |

## Nhận xét (trung thực)

1. **E_DART là cấu hình duy nhất 150/150 về đích, 0 va chạm, 0 timeout** trên cả ba kịch bản.
2. **Bù trễ là bắt buộc**: F_NODELAY có 34/150 va chạm (S3: 22/50).
3. **Lớp an toàn có ý nghĩa ở S2 (vật cản động)**: không có nó, scheduler thích nghi (B, D) va chạm 5–6/50.
4. **Thành phần bất định + frontier của scheduler (E so với Z_ZHUYI)**: Z dùng ít suy luận hơn (S2: 35 so với 77) nhưng ở S3 (trễ 160 ms, nhiễu lớn) có 7/50 lượt không về đích (p = 0.013). Đây là bằng chứng có ý nghĩa thống kê đầu tiên cho phần mới của scheduler — nhưng thất bại của Z là timeout (kẹt), không phải va chạm.
5. **So với 3 Hz cố định (G_FR_LOW)**: G dùng ít suy luận hơn (45/48/53 so với 75/77/62) và chỉ có 4/150 thất bại (1 va chạm ở S3, 3 timeout); khác biệt với E chưa có ý nghĩa thống kê. Câu hỏi "khi nào tần số cố định không đủ" được trả lời bằng quét tốc độ / độ trễ với các tần số 1–10 Hz (đang chạy).
6. **Biên an toàn**: ở S2, 2/50 lượt E_DART xuống dưới biên thiết kế 0.25 m (0.08 m, seed 16; 0.12 m, seed 12) dù không va chạm; cả hai có sai số ước lượng vật cản lớn (0.68, 0.98 m). Cùng hai seed chạy bằng MATLAB engine cho 0.50 m và 0.67 m: không tái hiện được (hai engine trùng nhau tới ~10⁻⁸ m lúc đầu nhưng sai khác dấu phẩy động lật một quyết định rời rạc về sau). Cần trace chạy bằng Simulink để phân tích; vì vậy kết luận về biên an toàn chỉ nên phát biểu ở dạng thống kê (ví dụ 48/50 lượt S2 giữ biên 0.25 m), không phải bảo đảm tất định.
7. Sau khi sửa trigger, số suy luận của E_DART giảm 22–29% so với lượt trước (98→75, 108→77, 79→62) mà không mất an toàn.
