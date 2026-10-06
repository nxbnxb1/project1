# Ablation đầy đủ — Simulink (7 biến thể × 3 kịch bản × 10 seed = 210 lượt)

* Nguồn: workflow **Experiments**, run [37429810971](https://github.com/nxbnxb1/project1/actions/runs/37429810971) (engine `simulink`, MATLAB R2024b), commit `cc7650d`.
* Dữ liệu thô: [`ablation_simulink_runs.log`](ablation_simulink_runs.log) (một dòng cho mỗi lượt, trích từ log CI); tổng hợp bằng [`parse_runs.py`](parse_runs.py).
* `clr` = khoảng cách thật nhỏ nhất từ **thân** UAV (bán kính 0.25 m) tới bề mặt vật cản; biên thiết kế `d_s − r_body = 0.25 m`. Thời gian và số suy luận chỉ tính trên các lượt về đích. `inf/s` = số suy luận / thời gian bay.

| Kịch bản | Biến thể | Thành công | Va chạm | Timeout | clr min | clr TB ± sd | t về đích [s] | Suy luận/lượt | inf/s | N TB | MPC [ms] |
|---|---|---|---|---|---|---|---|---|---|---|---|
| S1 | A_FR_FN | 100% | 0% | 0% | 0.06 | 0.36 ± 0.12 | 14.2 ± 1.9 | 132 ± 18 | 9.30 | 20.0 | 4.3 |
| S1 | B_AP_FN | 100% | 0% | 0% | 0.29 | 0.37 ± 0.06 | 13.6 ± 0.3 | 99 ± 8 | 7.26 | 20.0 | 4.2 |
| S1 | C_FR_AN | 100% | 0% | 0% | 0.04 | 0.37 ± 0.13 | 13.8 ± 0.3 | 129 ± 3 | 9.29 | 25.2 | 5.8 |
| S1 | D_AP_AN | 90% | 10% | 0% | −0.01 | 0.35 ± 0.14 | 13.8 ± 0.2 | 99 ± 4 | 7.24 | 25.4 | 5.9 |
| S1 | **E_DART** | 100% | 0% | 0% | **0.47** | 0.60 ± 0.08 | 17.6 ± 3.4 | 116 ± 15 | 6.63 | 25.3 | 6.9 |
| S1 | F_NODELAY | 80% | **20%** | 0% | −0.02 | 0.20 ± 0.15 | 25.9 ± 7.1 | 206 ± 59 | 8.15 | 25.8 | 8.1 |
| S1 | G_FR_LOW | 100% | 0% | 0% | 0.44 | 0.65 ± 0.12 | 17.8 ± 2.6 | 53 ± 8 | 2.97 | 25.5 | 7.1 |
| S2 | A_FR_FN | 90% | 10% | 0% | −0.00 | 0.28 ± 0.16 | 16.6 ± 1.4 | 154 ± 13 | 9.28 | 20.0 | 4.4 |
| S2 | B_AP_FN | 100% | 0% | 0% | 0.25 | 0.40 ± 0.10 | 16.3 ± 2.0 | 117 ± 13 | 7.23 | 20.0 | 4.2 |
| S2 | C_FR_AN | 80% | 20% | 0% | −0.02 | 0.22 ± 0.17 | 15.6 ± 0.9 | 145 ± 9 | 9.33 | 25.5 | 6.1 |
| S2 | D_AP_AN | 80% | 20% | 0% | −0.01 | 0.30 ± 0.19 | 15.9 ± 2.4 | 112 ± 12 | 7.30 | 25.2 | 6.0 |
| S2 | **E_DART** | 100% | 0% | 0% | **0.35** | 0.68 ± 0.19 | 18.7 ± 3.4 | 128 ± 24 | 6.88 | 24.1 | 6.4 |
| S2 | F_NODELAY | 90% | 10% | 0% | −0.00 | 0.68 ± 0.41 | 21.0 ± 5.0 | 148 ± 41 | 7.20 | 22.9 | 6.1 |
| S2 | G_FR_LOW | 100% | 0% | 0% | 0.53 | 0.91 ± 0.31 | 17.8 ± 2.2 | 53 ± 6 | 2.96 | 23.5 | 6.1 |
| S3 | A_FR_FN | 100% | 0% | 0% | 0.20 | 0.38 ± 0.10 | 14.1 ± 1.2 | 78 ± 5 | 5.56 | 20.0 | 4.3 |
| S3 | B_AP_FN | 100% | 0% | 0% | 0.21 | 0.39 ± 0.09 | 14.1 ± 1.2 | 68 ± 5 | 4.81 | 20.0 | 4.2 |
| S3 | C_FR_AN | 100% | 0% | 0% | 0.28 | 0.41 ± 0.09 | 13.9 ± 0.5 | 78 ± 4 | 5.57 | 25.6 | 5.9 |
| S3 | D_AP_AN | 100% | 0% | 0% | 0.28 | 0.40 ± 0.10 | 13.8 ± 0.3 | 67 ± 2 | 4.82 | 25.7 | 6.0 |
| S3 | **E_DART** | 90% | 0% | 10% | **0.37** | 0.62 ± 0.14 | 19.2 ± 3.4 | 91 ± 16 | 4.69 | 25.3 | 7.1 |
| S3 | F_NODELAY | 50% | **40%** | 10% | −0.01 | 0.15 ± 0.21 | 27.2 ± 10.3 | 136 ± 57 | 5.15 | 25.1 | 7.6 |
| S3 | G_FR_LOW | 80% | 0% | 20% | 0.13 | 0.57 ± 0.19 | 22.0 ± 7.3 | 65 ± 22 | 2.95 | 25.0 | 7.2 |

## Đối chiếu hai engine

Cùng 210 cấu hình cũng được chạy bằng MATLAB engine (run [37429813912](https://github.com/nxbnxb1/project1/actions/runs/37429813912)). Ở A–D kết quả trùng nhau. Ở S3, vài lượt cho kết cục khác: hai engine khởi đầu trùng tới 10⁻⁸ m nhưng sai khác dấu phẩy động làm lật một quyết định rời rạc về sau (hệ thống hỗn loạn khi sát biên). Theo MATLAB engine ở S3:
* E_DART: 0 va chạm, 2 timeout;
* G_FR_LOW: **2 va chạm**, 1 timeout;
* F_NODELAY: 3 va chạm, 1 timeout.

Gộp hai engine: **E_DART 0/60 va chạm** trên toàn bộ S1–S3; G_FR_LOW 2/60 (cả hai ở S3); F_NODELAY 10/60.

## Nhận xét (trung thực, chưa phải kết luận cuối)

1. **Bù trễ là thành phần quan trọng nhất.** Bỏ bù trễ (F) gây va chạm ở cả ba kịch bản (20% / 10% / 40%) dù vẫn có inflation + CBF, và làm nhiệm vụ chậm, tốn suy luận hơn.
2. **Lớp an toàn có bất định (inflation + braking-CBF + emergency) loại bỏ va chạm.** So với D (cùng scheduler + horizon thích nghi nhưng không có lớp này), E: 0/30 va chạm và clearance tối thiểu ≥ 0.35 m; D: 3/30 va chạm.
3. **Lập lịch thích nghi giảm 13–25% số suy luận so với 10 Hz cố định** mà không giảm an toàn (B so với A, D so với C).
4. **Một tần số thấp cố định (3 Hz) cùng đủ các lớp an toàn (G) tiết kiệm suy luận hơn DART ở S1/S2**, nhưng thất bại khi độ trễ cao (S3: 20% timeout; theo MATLAB engine có 2/10 va chạm). Câu hỏi then chốt cho bài báo là *khi nào* lập lịch thích nghi thắng tần số cố định → đang chạy quét độ trễ và tốc độ.
5. **Horizon thích nghi chưa cho lợi ích an toàn** ở dạng hiện tại (C so với A, D so với B), và tăng chi phí QP khoảng 35% do N trung bình ≈ 25 > 20. Cần xem lại luật chọn N (rủi ro bão hoà sớm) hoặc định vị lại đóng góp này.
6. **Cái giá của DART là thời gian nhiệm vụ dài hơn 13–36% so với A** (tính bảo thủ), và 1–2 lượt/10 bị kẹt (timeout) ở S3 — giới hạn của planner cục bộ.
