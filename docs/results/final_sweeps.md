# Các lượt quét cuối (commit `3438b2b`, MATLAB engine, 50 seed mỗi ô)

> **Phiên bản cũ của phương pháp (code `3438b2b`):** nhãn thật, tham chiếu thẳng tới đích, chỉ vật cản cầu, giới hạn 40 s, quét tốc độ chưa nới hộp vận tốc 5 m/s. "Oracle" ở đây là tần số cố định tốt nhất, không phải biến thể `O_ORACLE`. Không áp dụng cho phương pháp hiện tại; kết quả hiện tại: [`random_worlds.md`](random_worlds.md).

* Nguồn: workflow **Sweep** — tốc độ [37492153231](https://github.com/nxbnxb1/project1/actions/runs/37492153231), độ trễ [37492157907](https://github.com/nxbnxb1/project1/actions/runs/37492157907), sai số shift của depth [37492163108](https://github.com/nxbnxb1/project1/actions/runs/37492163108), horizon [37492166271](https://github.com/nxbnxb1/project1/actions/runs/37492166271). 12 100 lượt.
* Dữ liệu thô: [`raw/final_{speed,latency,shift,horizon}_*.log`](raw/). Bảng chi tiết theo từng giá trị: `python3 parse_sweep.py raw/final_speed_*.log` (tương tự cho các lượt khác); so sánh với tần số cố định tốt nhất: `python3 parse_oracle.py raw/final_speed_*.log`.
* `FR_SAFE_f`: **đủ** các lớp an toàn của DART (bù trễ, tracker hai mô hình, inflation, braking-CBF, emergency) nhưng perception cố định f Hz. `A_FR_FN`: 10 Hz, **không** có lớp an toàn. `F_NODELAY`: DART không bù trễ. `Z_ZHUYI`: scheduler kiểu Zhuyi (không bất định, không frontier).

## 1. Tổng hợp quét tốc độ và độ trễ

**Tốc độ 3–6 m/s** (3600 lượt; mỗi biến thể 400 lượt = 2 kịch bản × 4 giá trị × 50 seed)

| Biến thể | Va chạm | Timeout | Số điều kiện có thất bại | Suy luận / lượt (về đích) | Thời gian về đích [s] | clr nhỏ nhất [m] |
|---|---|---|---|---|---|---|
| **E_DART** | 0/400 | 2 | 1 | 77 | 16.0 | 0.08 |
| Z_ZHUYI | 0/400 | 2 | 2 | 46 | 17.4 | 0.29 |
| FR_SAFE_1 | 4/400 | 13 | 5 | 21 | 20.7 | -0.01 |
| FR_SAFE_2 | 0/400 | 0 | 0 | 34 | 16.9 | 0.25 |
| FR_SAFE_3 | 0/400 | 1 | 1 | 48 | 16.2 | 0.21 |
| FR_SAFE_5 | 0/400 | 1 | 1 | 79 | 15.7 | 0.24 |
| FR_SAFE_10 | 1/400 | 1 | 2 | 148 | 15.9 | -0.00 |
| A_FR_FN | 8/400 | 2 | 5 | 137 | 14.7 | -0.04 |
| F_NODELAY | 45/400 | 10 | 8 | 125 | 21.2 | -0.02 |

**Độ trễ 50–250 ms** (4500 lượt; mỗi biến thể 500 lượt = 2 kịch bản × 5 giá trị × 50 seed)

| Biến thể | Va chạm | Timeout | Số điều kiện có thất bại | Suy luận / lượt (về đích) | Thời gian về đích [s] | clr nhỏ nhất [m] |
|---|---|---|---|---|---|---|
| **E_DART** | 0/500 | 0 | 0 | 63 | 15.7 | 0.26 |
| Z_ZHUYI | 0/500 | 2 | 2 | 40 | 17.4 | 0.15 |
| FR_SAFE_1 | 2/500 | 14 | 4 | 21 | 20.8 | -0.01 |
| FR_SAFE_2 | 1/500 | 1 | 2 | 34 | 16.5 | -0.00 |
| FR_SAFE_3 | 0/500 | 3 | 3 | 47 | 16.0 | 0.21 |
| FR_SAFE_5 | 0/500 | 0 | 0 | 73 | 15.8 | 0.24 |
| FR_SAFE_10 | 0/500 | 0 | 0 | 102 | 15.7 | 0.18 |
| A_FR_FN | 17/500 | 2 | 5 | 97 | 14.8 | -0.04 |
| F_NODELAY | 161/500 | 3 | 10 | 103 | 20.8 | -0.04 |

## 2. So với tần số cố định tốt nhất cho từng điều kiện ("oracle")

Oracle = tần số cố định **nhỏ nhất** (trong 1, 2, 3, 5, 10 Hz, cùng lớp an toàn) không có va chạm và không timeout trên 50 seed của điều kiện đó.

| Scenario | speed | DART collisions | DART inferences | DART time [s] | oracle fixed rate | oracle inferences | oracle time [s] | DART / oracle inferences | fixed rates that failed |
|---|---|---|---|---|---|---|---|---|---|
| S1 | 3 | 0/50 [0,7]% | 62 | 18.6 | 2 Hz | 38 | 18.7 | 1.63 | 1 Hz: 0 coll./3 fail |
| S1 | 4 | 0/50 [0,7]% | 75 | 15.0 | 2 Hz | 33 | 16.4 | 2.26 | 1 Hz: 1 coll./3 fail; 3 Hz: 0 coll./1 fail; 5 Hz: 0 coll./1 fail |
| S1 | 5 | 0/50 [0,7]% | 82 | 14.1 | 2 Hz | 32 | 15.9 | 2.55 | 1 Hz: 2 coll./5 fail; 10 Hz: 1 coll./1 fail |
| S1 | 6 | 0/50 [0,7]% | 82 | 14.0 | 2 Hz | 32 | 15.8 | 2.56 | 1 Hz: 1 coll./5 fail |
| S2 | 3 | 0/50 [0,7]% | 61 | 19.9 | 1 Hz | 23 | 22.8 | 2.62 | – |
| S2 | 4 | 0/50 [0,7]% | 77 | 16.2 | 1 Hz | 19 | 18.8 | 4.01 | – |
| S2 | 5 | 0/50 [0,7]% | 86 | 15.2 | 2 Hz | 32 | 15.7 | 2.69 | 1 Hz: 0 coll./1 fail |
| S2 | 6 | 0/50 [0,7]% | 90 | 15.3 | 1 Hz | 19 | 18.6 | 4.71 | 10 Hz: 0 coll./1 fail |

| Scenario | latency | DART collisions | DART inferences | DART time [s] | oracle fixed rate | oracle inferences | oracle time [s] | DART / oracle inferences | fixed rates that failed |
|---|---|---|---|---|---|---|---|---|---|
| S1 | 0.05 | 0/50 [0,7]% | 88 | 14.9 | 1 Hz | 23 | 22.7 | 3.79 | – |
| S1 | 0.1 | 0/50 [0,7]% | 70 | 15.5 | 2 Hz | 32 | 16.0 | 2.17 | 1 Hz: 0 coll./3 fail; 3 Hz: 0 coll./1 fail |
| S1 | 0.15 | 0/50 [0,7]% | 58 | 15.1 | 2 Hz | 33 | 16.3 | 1.75 | 1 Hz: 2 coll./4 fail; 3 Hz: 0 coll./1 fail |
| S1 | 0.2 | 0/50 [0,7]% | 50 | 15.0 | 2 Hz | 33 | 16.1 | 1.51 | 1 Hz: 0 coll./5 fail |
| S1 | 0.25 | 0/50 [0,7]% | 44 | 15.4 | 2 Hz | 33 | 16.2 | 1.35 | 1 Hz: 0 coll./4 fail; 3 Hz: 0 coll./1 fail |
| S2 | 0.05 | 0/50 [0,7]% | 91 | 16.2 | 1 Hz | 20 | 19.8 | 4.50 | 2 Hz: 0 coll./1 fail |
| S2 | 0.1 | 0/50 [0,7]% | 69 | 16.1 | 1 Hz | 20 | 19.1 | 3.52 | 2 Hz: 1 coll./1 fail |
| S2 | 0.15 | 0/50 [0,7]% | 60 | 16.3 | 1 Hz | 20 | 19.4 | 2.98 | – |
| S2 | 0.2 | 0/50 [0,7]% | 52 | 16.0 | 1 Hz | 20 | 19.5 | 2.60 | – |
| S2 | 0.25 | 0/50 [0,7]% | 48 | 16.7 | 1 Hz | 21 | 20.0 | 2.34 | – |

## 3. Sai số độ dịch (shift) của inverse depth

### S1 — failure  (shift = 0.0025, 0.005, 0.01, 0.02)
| variant | 0.0025 | 0.005 | 0.01 | 0.02 |
|---|---|---|---|---|
| E_DART | 0/50 | 1/50 | 1/50 | 5/50 |
| A_FR_FN | 0/50 | 0/50 | 0/50 | 1/50 |
| FR_SAFE_10 | 0/50 | 0/50 | 0/50 | 1/50 |
| FR_SAFE_3 | 0/50 | 0/50 | 0/50 | 5/50 |
| Z_ZHUYI | 2/50 | 5/50 | 2/50 | 25/50 |

### S2 — failure  (shift = 0.0025, 0.005, 0.01, 0.02)
| variant | 0.0025 | 0.005 | 0.01 | 0.02 |
|---|---|---|---|---|
| E_DART | 0/50 | 0/50 | 0/50 | 1/50 |
| A_FR_FN | 2/50 | 4/50 | 4/50 | 4/50 |
| FR_SAFE_10 | 0/50 | 0/50 | 0/50 | 0/50 |
| FR_SAFE_3 | 0/50 | 0/50 | 0/50 | 1/50 |
| Z_ZHUYI | 0/50 | 0/50 | 0/50 | 7/50 |

### S1 — inferences  (shift = 0.0025, 0.005, 0.01, 0.02)
| variant | 0.0025 | 0.005 | 0.01 | 0.02 |
|---|---|---|---|---|
| E_DART | 76 | 79 | 85 | 106 |
| A_FR_FN | 131 | 131 | 130 | 130 |
| FR_SAFE_10 | 137 | 136 | 144 | 179 |
| FR_SAFE_3 | 46 | 46 | 51 | 73 |
| Z_ZHUYI | 54 | 53 | 50 | 53 |

### S2 — inferences  (shift = 0.0025, 0.005, 0.01, 0.02)
| variant | 0.0025 | 0.005 | 0.01 | 0.02 |
|---|---|---|---|---|
| E_DART | 78 | 76 | 80 | 92 |
| A_FR_FN | 148 | 145 | 143 | 142 |
| FR_SAFE_10 | 151 | 152 | 157 | 191 |
| FR_SAFE_3 | 49 | 50 | 52 | 73 |
| Z_ZHUYI | 37 | 30 | 29 | 33 |

### S1 — time  (shift = 0.0025, 0.005, 0.01, 0.02)
| variant | 0.0025 | 0.005 | 0.01 | 0.02 |
|---|---|---|---|---|
| E_DART | 15.0 | 15.4 | 16.1 | 24.1 |
| A_FR_FN | 14.1 | 14.0 | 14.0 | 14.0 |
| FR_SAFE_10 | 14.7 | 14.7 | 15.5 | 19.3 |
| FR_SAFE_3 | 15.3 | 15.6 | 17.1 | 24.6 |
| Z_ZHUYI | 17.2 | 17.9 | 20.6 | 31.8 |

### S2 — time  (shift = 0.0025, 0.005, 0.01, 0.02)
| variant | 0.0025 | 0.005 | 0.01 | 0.02 |
|---|---|---|---|---|
| E_DART | 16.3 | 16.4 | 17.6 | 23.7 |
| A_FR_FN | 15.9 | 15.6 | 15.4 | 15.3 |
| FR_SAFE_10 | 16.3 | 16.3 | 16.9 | 20.5 |
| FR_SAFE_3 | 16.4 | 16.7 | 17.5 | 24.7 |
| Z_ZHUYI | 18.2 | 19.1 | 21.1 | 26.0 |


(`failure` = va chạm + timeout; va chạm: E_DART 0/400, Z_ZHUYI 1/400, FR_SAFE_3 1/400, FR_SAFE_10 1/400, A_FR_FN 13/400.)

## 4. Horizon: thích nghi (E_DART) so với cố định N = 15, 20, 30 (đủ lớp an toàn)

### S1 — failure  (speed = 3, 4, 5, 6)
| variant | 3 | 4 | 5 | 6 |
|---|---|---|---|---|
| E_DART | 2/50 | 0/50 | 0/50 | 0/50 |
| FN_SAFE_15 | 0/50 | 1/50 | 0/50 | 0/50 |
| FN_SAFE_20 | 0/50 | 0/50 | 0/50 | 0/50 |
| FN_SAFE_30 | 2/50 | 0/50 | 0/50 | 0/50 |

### S2 — failure  (speed = 3, 4, 5, 6)
| variant | 3 | 4 | 5 | 6 |
|---|---|---|---|---|
| E_DART | 0/50 | 0/50 | 0/50 | 0/50 |
| FN_SAFE_15 | 0/50 | 0/50 | 0/50 | 0/50 |
| FN_SAFE_20 | 1/50 | 0/50 | 1/50 | 0/50 |
| FN_SAFE_30 | 1/50 | 1/50 | 1/50 | 1/50 |

### S1 — inferences  (speed = 3, 4, 5, 6)
| variant | 3 | 4 | 5 | 6 |
|---|---|---|---|---|
| E_DART | 62 | 75 | 82 | 82 |
| FN_SAFE_15 | 67 | 80 | 85 | 85 |
| FN_SAFE_20 | 63 | 76 | 84 | 84 |
| FN_SAFE_30 | 67 | 78 | 84 | 84 |

### S2 — inferences  (speed = 3, 4, 5, 6)
| variant | 3 | 4 | 5 | 6 |
|---|---|---|---|---|
| E_DART | 62 | 77 | 86 | 90 |
| FN_SAFE_15 | 68 | 80 | 86 | 89 |
| FN_SAFE_20 | 62 | 78 | 84 | 85 |
| FN_SAFE_30 | 61 | 80 | 88 | 87 |

### S1 — time  (speed = 3, 4, 5, 6)
| variant | 3 | 4 | 5 | 6 |
|---|---|---|---|---|
| E_DART | 18.6 | 15.0 | 14.1 | 13.9 |
| FN_SAFE_15 | 18.8 | 15.6 | 14.4 | 14.0 |
| FN_SAFE_20 | 18.6 | 15.0 | 13.8 | 13.7 |
| FN_SAFE_30 | 19.5 | 14.9 | 13.7 | 13.5 |

### S2 — time  (speed = 3, 4, 5, 6)
| variant | 3 | 4 | 5 | 6 |
|---|---|---|---|---|
| E_DART | 19.8 | 16.2 | 15.2 | 15.2 |
| FN_SAFE_15 | 20.5 | 17.6 | 15.6 | 16.0 |
| FN_SAFE_20 | 20.4 | 17.3 | 15.4 | 16.5 |
| FN_SAFE_30 | 20.1 | 16.6 | 15.5 | 14.9 |


## 5. Kết luận trung thực

1. **Bù trễ là bắt buộc**: không bù trễ → 206 va chạm / 900 lượt quét (tăng đơn điệu theo độ trễ).
2. **Lớp an toàn có xét bất định + bộ nhớ vật cản là yếu tố quyết định an toàn.** Với lớp này, perception cố định **2 Hz** cho 1 va chạm / 900 lượt, trong khi 10 Hz **không** có lớp này cho 25 va chạm / 900 lượt — tức an toàn hơn với ~4–5 lần ít suy luận hơn.
3. **Lập lịch perception thích nghi của DART không tốt hơn một tần số cố định được chọn hợp lý trong các kịch bản này.** DART là cấu hình duy nhất 0 va chạm trên toàn bộ quét, nhưng tần số cố định 2–5 Hz cũng gần như không thất bại; so với oracle từng điều kiện, DART dùng 1.35–4.7× suy luận, đổi lại nhiệm vụ ngắn hơn 5–20%. Lý do vật lý: với tầm cảm biến 15 m, ngay cả 1 Hz ở 6 m/s vẫn thoả điều kiện dừng trước biên vùng đã thấy (6 m/s × 1.25 s + quãng phanh 4.5 m ≈ 12 m < 14 m), nên tần số thấp đã đủ.
4. **Thành phần bất định của scheduler có ích so với scheduler tất định kiểu Zhuyi**: khi sai số depth lớn (shift 0.02), Z_ZHUYI thất bại 25/50 (S1) so với 5/50 của DART; ở S3 (ablation Simulink) 7/50 so với 0/50 (p = 0.013). Nhưng không hơn tần số cố định 3 Hz (5/50).
5. **Horizon thích nghi không đóng góp gì đo được** (an toàn, suy luận, thời gian như horizon cố định) → nên bỏ khỏi danh sách đóng góp.
6. Hệ quả: đóng góp thực nghiệm mạnh nhất hiện là **ước lượng bù trễ + lớp an toàn có xét bất định cho phép perception học được chạy ở tần số thấp (2–3 Hz) một cách an toàn**; lập lịch thích nghi chỉ có lợi thế (chưa được chứng minh) trong chế độ mà tần số thấp cố định không đủ — cần các kịch bản khó hơn (tầm cảm biến ngắn, tốc độ cao, vật cản bị che khuất) để kiểm tra.
