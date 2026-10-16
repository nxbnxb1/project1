# Kết quả lưới chốt

**Thuật toán:** commit `2a536b1` (vật cản hình trụ đứng, chụp liên tục khi gần như đứng yên, tần số quét tối đa
`f_max` là trần cứng, thêm bối cảnh siêu dễ SE). Phần bỏ giới hạn tốc độ theo mật độ và phần camera chạy trên commit
`82a2f03`; commit này chỉ thêm cách giải mã tham số quét `camspeedrate` và trình lập bảng, **thuật toán giữ nguyên**.
Mô tả phương pháp: [`README.md`](../../README.md), Mục 2. Cách chạy lại: README, Mục 3.2.

**Số lượt:** 36 000 lượt bay trong 15 lần chạy *Sweep* trên GitHub Actions (MATLAB engine), không job nào lỗi. Log
gốc: [`raw/f*`](raw/) (một dòng mỗi lượt, kèm `gap`, `DENS`, `FAILINFO`, `WORLD`). Mọi bảng dưới đây sinh bằng

```
python3 docs/results/final_tables.py
```

| phần | kịch bản | thế giới (seed) | tốc độ yêu cầu [m/s] | trần tần số `f_max` [Hz] | phương án | camera | số lượt | lần chạy CI |
|---|---|---|---|---|---|---|---|---|
| quét tần số | SN | 1–60 | 6, 10, 15 | 0.5, 1, …, 5 (10 mức) | E_COV, FR_SAFE, E_DART | Module 3 Wide | 5 400 | 38132774498, 38132782216, 38132788927 |
| quét tần số | SH | 1–30 | như trên | như trên | như trên | Module 3 Wide | 2 700 | 38132795484, 38132801458, 38132807445 |
| quét tần số | SE | 1–30 | như trên | như trên | như trên | Module 3 Wide | 2 700 | 38132812918 |
| bỏ giới hạn theo mật độ | SN / SH / SE | như trên | như trên | như trên | COV_NOCLUT | Module 3 Wide | 1 800 / 900 / 900 | 38133989659, 38133997977, 38134006363 |
| camera | SN / SH / SE | như trên | như trên | như trên | E_COV, FR_SAFE | v2, Module 3, Module 3 Wide 640×360 | 10 800 / 5 400 / 5 400 | 38134015081, 38134023258 (SN); 38134031683, 38134039247 (SH); 38134046609 (SE) |

Các dòng Module 3 Wide (camera mặc định, mạng 320×180) của phần camera lấy từ phần quét tần số: cùng thế giới, tốc
độ, trần tần số và phương án. Một lượt chỉ dừng khi tới đích, va chạm, hoặc kẹt (không tiến thêm 1 m dọc quỹ đạo đặt
trong 60 s); không giới hạn thời gian. "Va chạm tĩnh" là va chạm với vật đứng yên (trong phạm vi bài toán); va chạm với
xe đang chạy cắt ngang (chỉ có ở SH, seed chia hết cho 3) ghi riêng vì thuật toán coi mọi vật là tĩnh. Kiểm định:
Fisher chính xác hai phía.

## 1. Tóm tắt

1. **Trần tần số được giữ đúng.** Trong 36 000 lượt, không lượt nào có hai lần chụp cách nhau ít hơn 1/`f_max`
   (dung sai một bước điều khiển 10 ms), kể cả khi khẩn cấp và khi đứng yên.
2. **Kẹt gần như hết.** Với trần ≥ 1.5 Hz và camera mặc định: SN 0.1–0.3 %, SH 0.3–1.2 %, SE 0–0.1 % số lượt. Ở
   trần 3 Hz, E_COV từ 15 lượt kẹt / 270 (vòng 7) xuống 0 / 270 (p = 5·10⁻⁵).
3. **Trần cần ít nhất 1.5 Hz.** Ở 0.5 Hz, 22–31 % lượt SN va chạm; 1 Hz còn 4–8 %. Từ 1.5 Hz trở lên số va chạm mỗi
   ô SN chỉ còn 1–9 / 180 và **không giảm thêm rõ rệt** khi tăng trần lên 5 Hz: phần va chạm còn lại không do thiếu
   khung hình (xem điểm 7).
4. **Tiết kiệm tính toán.** Cùng trần, E_COV chỉ dùng 0.54–0.72 số lần suy luận của FR_SAFE trên SN, 0.50–0.63 trên SE,
   0.61–0.81 trên SH (1.5–5 Hz). Va chạm tĩnh gộp 1.5–5 Hz: SN 2.4 % so với 2.0 % (p = 0.53), SE 0.3 % so với 0.4 %
   (p = 1), SH 8.2 % so với 5.8 % (p = 0.098). Ở cùng ngân sách tính toán xấp xỉ (E_COV trần 2f so với FR_SAFE trần f),
   E_COV thất bại ít hơn trên SN (16 so với 35 / 720 lượt, p = 0.0096; chủ yếu ở cặp thấp nhất 2 Hz – 1 Hz); trên SH
   (31 so với 43 / 360, p = 0.18, nhưng E_COV dùng nhiều hơn 7–24 % suy luận) và SE (0 so với 5 / 360, p = 0.062)
   khác biệt không có ý nghĩa thống kê.
5. **E_COV tốt hơn E_DART** ở cùng trần và gần cùng số suy luận (tỉ lệ 0.93–0.98): va chạm tĩnh SN 2.4 % so với 3.9 %
   (p = 0.033), SH 8.2 % so với 12.2 % (p = 0.015).
6. **Giới hạn tốc độ theo mật độ không thấy tác dụng an toàn đo được trên lưới này**: COV_NOCLUT va chạm tĩnh SN 2.2 %,
   SH 7.5 %, SE 0.4 % so với E_COV 2.4 / 8.2 / 0.3 % (p ≥ 0.7); kẹt trên SH 1.2 % so với 0.3 % (p = 0.064); tới đích
   nhanh hơn một chút (SN, 15 m/s: 33.5 s so với 36.4 s). Ở vòng 7 (hình cầu, chưa có trần cứng) khối này giảm va chạm
   trên SH (2 so với 11 / 90); sau các thay đổi của bản chốt, khác biệt đó không còn.
7. **Kiểu va chạm còn lại là một kiểu chung, không phải vài ca hiếm.** Với trần ≥ 1.5 Hz, camera mặc định: **mọi** va
   chạm tĩnh xảy ra khi UAV **đang vòng tránh** và với một vật **đã có trong bộ nhớ** (một track hình trụ cách bề mặt
   thật dưới 1 m); 79 % xảy ra khi vật đã **ra khỏi khung hình** (SN 119 / 151, SH 192 / 243, SE 12 / 16). Va chạm trải
   trên 37 / 60 thế giới SN và cả 30 thế giới SH; tốc độ lúc va chạm (trung vị) 5.3–5.5 m/s, tốc độ lao vào vật 2.1–3.3
   m/s. Tốc độ yêu cầu gần như không ảnh hưởng (SN, E_COV: 3.1 / 2.1 / 2.1 % ở 6 / 10 / 15 m/s).
8. **Tốc độ tự thích nghi theo mật độ** (SN, E_COV, trần 3 Hz, yêu cầu 15 m/s): 11.2 m/s khi không có vật nào trong
   15 m, 8.9 m/s với 1–2 vật, 5.6 m/s với 3–5 vật, 3.8 m/s khi ≥ 6 vật; tần số chụp tăng theo, 1.76 → 2.59 khung/s, trong
   khi FR_SAFE luôn chụp 3 khung/s.
9. **Camera góc rộng là điều kiện cần.** Gộp E_COV và FR_SAFE, 1.5–5 Hz, va chạm tĩnh trên SN: Module 3 Wide 2.2 %,
   Module 3 Wide 640×360 3.1 %, v2 10.7 %, Module 3 11.9 %. Với camera hẹp, ngay cả cảnh siêu dễ SE cũng va chạm 6–7 %,
   gần như toàn bộ ở hai cảnh hành lang (đại lộ hàng cây, khe phố). Mạng 640×360 không giúp: mỗi lần suy luận tốn gấp 4 lần và
   trễ trung bình 320 ms thay cho 80 ms.

## 2. Quét trần tần số (camera mặc định)

### 2.1. Bay thường SN

Mỗi ô: va chạm với vật tĩnh / kẹt / suy luận mỗi nhiệm vụ (trung vị, lượt tới đích).

| f_max [Hz] | E_COV | FR_SAFE | E_DART | COV_NOCLUT |
|---|---|---|---|---|
| 0.5 | 40 / 4 / 25 | 50 / 11 / 28 | 51 / 7 / 29 | 55 / 2 / 24 |
| 1 | 8 / 2 / 36 | 12 / 4 / 54 | 13 / 4 / 54 | 15 / 0 / 38 |
| 1.5 | 7 / 1 / 49 | 5 / 1 / 78 | 8 / 1 / 61 | 7 / 0 / 46 |
| 2 | 3 / 1 / 62 | 7 / 2 / 96 | 9 / 1 / 68 | 4 / 1 / 58 |
| 2.5 | 3 / 0 / 71 | 3 / 1 / 120 | 5 / 1 / 75 | 1 / 0 / 66 |
| 3 | 3 / 0 / 77 | 4 / 0 / 134 | 3 / 0 / 80 | 5 / 0 / 75 |
| 3.5 | 5 / 1 / 89 | 1 / 1 / 156 | 7 / 2 / 84 | 5 / 0 / 84 |
| 4 | 6 / 0 / 100 | 1 / 0 / 176 | 8 / 0 / 92 | 4 / 0 / 92 |
| 4.5 | 5 / 0 / 106 | 3 / 0 / 193 | 8 / 0 / 96 | 4 / 0 / 96 |
| 5 | 3 / 0 / 113 | 5 / 0 / 208 | 8 / 0 / 103 | 1 / 0 / 117 |

### 2.2. Kịch bản khó SH

Mỗi ô: va chạm với vật tĩnh / kẹt / suy luận mỗi nhiệm vụ (trung vị, lượt tới đích). Va chạm với xe đang chạy (ngoài phạm vi) ghi riêng ở cột cuối.

| f_max [Hz] | E_COV | FR_SAFE | E_DART | COV_NOCLUT | xe đang chạy (E_COV / FR_SAFE / E_DART / COV_NOCLUT) |
|---|---|---|---|---|---|
| 0.5 | 47 / 7 / 52 | 49 / 4 / 64 | 43 / 13 / 68 | 50 / 2 / 51 | 1 / 2 / 1 / 1 |
| 1 | 13 / 6 / 79 | 13 / 7 / 91 | 12 / 4 / 90 | 17 / 4 / 78 | 1 / 2 / 0 / 2 |
| 1.5 | 12 / 1 / 94 | 5 / 1 / 112 | 13 / 0 / 101 | 10 / 6 / 88 | 2 / 2 / 2 / 2 |
| 2 | 7 / 0 / 107 | 6 / 1 / 139 | 10 / 1 / 120 | 7 / 3 / 109 | 2 / 2 / 1 / 1 |
| 2.5 | 8 / 0 / 120 | 10 / 0 / 164 | 12 / 0 / 132 | 5 / 0 / 114 | 1 / 2 / 1 / 1 |
| 3 | 9 / 0 / 134 | 1 / 0 / 192 | 9 / 1 / 140 | 2 / 0 / 113 | 3 / 1 / 2 / 2 |
| 3.5 | 4 / 1 / 164 | 3 / 0 / 208 | 10 / 1 / 146 | 9 / 0 / 133 | 0 / 3 / 2 / 0 |
| 4 | 10 / 0 / 167 | 7 / 0 / 249 | 10 / 0 / 159 | 9 / 0 / 136 | 1 / 2 / 3 / 2 |
| 4.5 | 4 / 0 / 168 | 5 / 1 / 268 | 9 / 0 / 167 | 7 / 0 / 148 | 3 / 2 / 2 / 1 |
| 5 | 5 / 0 / 184 | 5 / 0 / 296 | 15 / 0 / 189 | 5 / 0 / 164 | 1 / 3 / 2 / 2 |

### 2.3. Bối cảnh siêu dễ SE

Mỗi ô: va chạm với vật tĩnh / kẹt / suy luận mỗi nhiệm vụ (trung vị, lượt tới đích).

| f_max [Hz] | E_COV | FR_SAFE | E_DART | COV_NOCLUT |
|---|---|---|---|---|
| 0.5 | 3 / 3 / 12 | 6 / 2 / 18 | 6 / 0 / 18 | 4 / 2 / 12 |
| 1 | 2 / 0 / 19 | 3 / 0 / 35 | 0 / 0 / 36 | 1 / 0 / 17 |
| 1.5 | 1 / 0 / 25 | 0 / 0 / 53 | 2 / 1 / 37 | 1 / 0 / 23 |
| 2 | 0 / 0 / 31 | 1 / 0 / 70 | 1 / 0 / 41 | 0 / 0 / 30 |
| 2.5 | 1 / 0 / 39 | 1 / 0 / 84 | 0 / 0 / 46 | 1 / 0 / 36 |
| 3 | 0 / 0 / 42 | 1 / 0 / 96 | 0 / 0 / 52 | 0 / 0 / 42 |
| 3.5 | 0 / 0 / 48 | 0 / 0 / 110 | 2 / 0 / 55 | 0 / 0 / 46 |
| 4 | 0 / 0 / 55 | 0 / 0 / 124 | 0 / 0 / 59 | 0 / 0 / 48 |
| 4.5 | 0 / 0 / 58 | 0 / 0 / 124 | 1 / 0 / 65 | 0 / 0 / 55 |
| 5 | 0 / 0 / 60 | 0 / 0 / 144 | 2 / 0 / 70 | 1 / 0 / 58 |

SE gồm sáu cảnh đời thường (bãi trống, một cây giữa đường, đại lộ hai hàng cây, xe đỗ ven đường và một xe tải chắn
đường, dãy nhà ven đường, khe phố); mỗi cảnh 5 thế giới. Từ 1.5 Hz trở lên, cả bốn phương án va chạm 0–2 / 90 mỗi ô.

## 3. So sánh phương án

### 3.1. Tổng hợp

| kịch bản | phương án | 3 Hz: va chạm tĩnh / kẹt / suy luận | 1.5–5 Hz gộp: va chạm tĩnh | 1.5–5 Hz gộp: kẹt | 1.5–5 Hz gộp: khung/s trung bình |
|---|---|---|---|---|---|
| SN | E_COV | 3 / 0 / 77 (của 180) | 35 / 1440 (2.4 %) | 3 / 1440 (0.2 %) | 1.89 |
| SN | FR_SAFE | 4 / 0 / 134 (của 180) | 29 / 1440 (2.0 %) | 5 / 1440 (0.3 %) | 3.23 |
| SN | E_DART | 3 / 0 / 80 (của 180) | 56 / 1440 (3.9 %) | 5 / 1440 (0.3 %) | 1.89 |
| SN | COV_NOCLUT | 5 / 0 / 75 (của 180) | 31 / 1440 (2.2 %) | 1 / 1440 (0.1 %) | 1.87 |
| SH | E_COV | 9 / 0 / 134 (của 90) | 59 / 720 (8.2 %) | 2 / 720 (0.3 %) | 2.16 |
| SH | FR_SAFE | 1 / 0 / 192 (của 90) | 42 / 720 (5.8 %) | 3 / 720 (0.4 %) | 3.22 |
| SH | E_DART | 9 / 1 / 140 (của 90) | 88 / 720 (12.2 %) | 3 / 720 (0.4 %) | 2.28 |
| SH | COV_NOCLUT | 2 / 0 / 113 (của 90) | 54 / 720 (7.5 %) | 9 / 720 (1.2 %) | 2.16 |
| SE | E_COV | 0 / 0 / 42 (của 90) | 2 / 720 (0.3 %) | 0 / 720 (0.0 %) | 1.66 |
| SE | FR_SAFE | 1 / 0 / 96 (của 90) | 3 / 720 (0.4 %) | 0 / 720 (0.0 %) | 3.23 |
| SE | E_DART | 0 / 0 / 52 (của 90) | 8 / 720 (1.1 %) | 1 / 720 (0.1 %) | 1.87 |
| SE | COV_NOCLUT | 0 / 0 / 42 (của 90) | 3 / 720 (0.4 %) | 0 / 720 (0.0 %) | 1.64 |

"Khung/s trung bình" của FR_SAFE gần bằng trung bình các trần (3.25 Hz), vì nó luôn chụp đúng `f_max`.

### 3.2. Từng cặp

| kịch bản | so sánh | va chạm tĩnh | p | kẹt | p | suy luận E_COV / phương án kia (lượt cả hai tới đích, 3 Hz) |
|---|---|---|---|---|---|---|
| SN | E_COV – FR_SAFE | 2.4 % – 2.0 % | 0.53 | 0.2 % – 0.3 % | 0.73 | 0.61 |
| SN | E_COV – E_DART | 2.4 % – 3.9 % | 0.033 | 0.2 % – 0.3 % | 0.73 | 0.97 |
| SN | E_COV – COV_NOCLUT | 2.4 % – 2.2 % | 0.71 | 0.2 % – 0.1 % | 0.62 | 0.99 |
| SH | E_COV – FR_SAFE | 8.2 % – 5.8 % | 0.098 | 0.3 % – 0.4 % | 1 | 0.75 |
| SH | E_COV – E_DART | 8.2 % – 12.2 % | 0.015 | 0.3 % – 0.4 % | 1 | 0.98 |
| SH | E_COV – COV_NOCLUT | 8.2 % – 7.5 % | 0.7 | 0.3 % – 1.2 % | 0.064 | 1.18 |
| SE | E_COV – FR_SAFE | 0.3 % – 0.4 % | 1 | 0.0 % – 0.0 % | 1 | 0.60 |
| SE | E_COV – E_DART | 0.3 % – 1.1 % | 0.11 | 0.0 % – 0.1 % | 1 | 0.93 |
| SE | E_COV – COV_NOCLUT | 0.3 % – 0.4 % | 1 | 0.0 % – 0.0 % | 1 | 1.00 |

Cột cuối: tổng số suy luận của E_COV chia cho của phương án kia, trên các lượt mà cả hai cùng tới đích ở trần 3 Hz
(cùng thế giới, cùng tốc độ yêu cầu). Tỉ lệ đó giữa E_COV và FR_SAFE theo từng trần (cùng cách tính):

| kịch bản | 0.5 Hz | 1 Hz | 1.5 Hz | 2 Hz | 2.5 Hz | 3 Hz | 3.5 Hz | 4 Hz | 4.5 Hz | 5 Hz |
|---|---|---|---|---|---|---|---|---|---|---|
| SN | 0.87 | 0.75 | 0.72 | 0.68 | 0.64 | 0.61 | 0.61 | 0.56 | 0.57 | 0.54 |
| SH | 0.85 | 0.88 | 0.81 | 0.79 | 0.78 | 0.75 | 0.73 | 0.66 | 0.63 | 0.61 |
| SE | 0.89 | 0.73 | 0.63 | 0.61 | 0.61 | 0.60 | 0.57 | 0.56 | 0.52 | 0.50 |

### 3.3. Cùng ngân sách tính toán xấp xỉ

Mỗi ô: suy luận mỗi nhiệm vụ (trung bình, lượt tới đích) / va chạm tĩnh / kẹt. Dòng cuối mỗi kịch bản gộp bốn cặp; p: Fisher hai phía trên số lượt thất bại (va chạm tĩnh + kẹt).

| kịch bản | E_COV trần | FR_SAFE trần | E_COV | FR_SAFE | p |
|---|---|---|---|---|---|
| SN | 2 Hz | 1 Hz | 70 / 3 / 1 (của 180) | 59 / 12 / 4 (của 180) | 0.0097 |
| SN | 3 Hz | 1.5 Hz | 88 / 3 / 0 (của 180) | 82 / 5 / 1 (của 180) | 0.5 |
| SN | 4 Hz | 2 Hz | 106 / 6 / 0 (của 180) | 101 / 7 / 2 (của 180) | 0.6 |
| SN | 5 Hz | 2.5 Hz | 127 / 3 / 0 (của 180) | 128 / 3 / 1 (của 180) | 1 |
| SN | gộp | gộp | 15 / 1 (của 720) | 27 / 8 (của 720) | 0.0096 |
| SH | 2 Hz | 1 Hz | 118 / 7 / 0 (của 90) | 98 / 13 / 7 (của 90) | 0.011 |
| SH | 3 Hz | 1.5 Hz | 152 / 9 / 0 (của 90) | 123 / 5 / 1 (của 90) | 0.59 |
| SH | 4 Hz | 2 Hz | 168 / 10 / 0 (của 90) | 148 / 6 / 1 (của 90) | 0.61 |
| SH | 5 Hz | 2.5 Hz | 190 / 5 / 0 (của 90) | 178 / 10 / 0 (của 90) | 0.28 |
| SH | gộp | gộp | 31 / 0 (của 360) | 34 / 9 (của 360) | 0.18 |
| SE | 2 Hz | 1 Hz | 45 / 0 / 0 (của 90) | 47 / 3 / 0 (của 90) | 0.25 |
| SE | 3 Hz | 1.5 Hz | 57 / 0 / 0 (của 90) | 64 / 0 / 0 (của 90) | 1 |
| SE | 4 Hz | 2 Hz | 70 / 0 / 0 (của 90) | 73 / 1 / 0 (của 90) | 1 |
| SE | 5 Hz | 2.5 Hz | 75 / 0 / 0 (của 90) | 85 / 1 / 0 (của 90) | 1 |
| SE | gộp | gộp | 0 / 0 (của 360) | 5 / 0 (của 360) | 0.062 |

### 3.4. Theo tốc độ yêu cầu

Mỗi ô: va chạm tĩnh (tỉ lệ) / kẹt / thời gian tới đích trung vị [s].

| kịch bản | phương án | 6 m/s | 10 m/s | 15 m/s |
|---|---|---|---|---|
| SN | E_COV | 3.1 % / 2 / 59.4 | 2.1 % / 0 / 40.2 | 2.1 % / 1 / 36.4 |
| SN | FR_SAFE | 2.5 % / 4 / 58.5 | 1.9 % / 0 / 40.1 | 1.7 % / 1 / 36.9 |
| SN | E_DART | 4.4 % / 3 / 58.7 | 3.1 % / 0 / 41.1 | 4.2 % / 2 / 36.2 |
| SN | COV_NOCLUT | 3.5 % / 1 / 58.8 | 1.7 % / 0 / 38.8 | 1.2 % / 0 / 33.5 |
| SH | E_COV | 9.2 % / 0 / 76.3 | 7.9 % / 2 / 63.0 | 7.5 % / 0 / 59.6 |
| SH | FR_SAFE | 6.2 % / 3 / 74.0 | 5.8 % / 0 / 58.9 | 5.4 % / 0 / 58.4 |
| SH | E_DART | 10.8 % / 1 / 74.1 | 12.9 % / 2 / 60.0 | 12.9 % / 0 / 59.2 |
| SH | COV_NOCLUT | 5.8 % / 5 / 76.1 | 9.6 % / 2 / 56.0 | 7.1 % / 2 / 52.2 |
| SE | E_COV | 0.0 % / 0 / 36.0 | 0.0 % / 0 / 24.8 | 0.8 % / 0 / 22.4 |
| SE | FR_SAFE | 0.0 % / 0 / 36.1 | 0.0 % / 0 / 25.0 | 1.2 % / 0 / 23.4 |
| SE | E_DART | 0.8 % / 1 / 36.1 | 0.8 % / 0 / 25.6 | 1.7 % / 0 / 23.4 |
| SE | COV_NOCLUT | 0.4 % / 0 / 36.2 | 0.0 % / 0 / 24.1 | 0.8 % / 0 / 20.1 |

Thời gian tới đích giảm rõ từ 6 lên 10 m/s, ít hơn từ 10 lên 15 m/s: ở 15 m/s UAV bị giới hạn bởi tầm nhìn
(v·T_r + v²/(2a_b) + d_s ≤ R_eff) và bởi mật độ vật cản trong phần lớn quãng bay.

### 3.5. Tốc độ và tần số chụp theo mật độ vật cản

Mỗi ô: tỉ lệ thời gian, tốc độ trung bình [m/s], khung/s, theo số vật trong bán kính 15 m.

| kịch bản | phương án | 0 vật | 1–2 vật | 3–5 vật | ≥ 6 vật |
|---|---|---|---|---|---|
| SE | E_COV | 42 %, 8.8, 1.21 | 22 %, 8.5, 1.86 | 16 %, 7.6, 2.39 | 20 %, 4.7, 2.71 |
| SE | FR_SAFE | 42 %, 8.9, 2.99 | 17 %, 9.1, 2.93 | 21 %, 6.8, 2.93 | 20 %, 4.8, 2.95 |
| SE | E_DART | 39 %, 8.8, 1.73 | 18 %, 9.0, 2.09 | 19 %, 7.0, 2.40 | 24 %, 3.9, 2.57 |
| SE | COV_NOCLUT | 42 %, 8.9, 1.19 | 23 %, 9.3, 1.78 | 17 %, 6.4, 2.40 | 18 %, 4.6, 2.70 |
| SN | E_COV | 30 %, 11.2, 1.76 | 33 %, 8.9, 1.92 | 28 %, 5.6, 2.29 | 10 %, 3.8, 2.59 |
| SN | FR_SAFE | 30 %, 11.2, 2.99 | 34 %, 8.5, 2.94 | 29 %, 5.5, 2.94 | 7 %, 4.8, 2.97 |
| SN | E_DART | 29 %, 11.3, 2.24 | 35 %, 8.1, 2.09 | 28 %, 5.6, 2.22 | 8 %, 4.5, 2.35 |
| SN | COV_NOCLUT | 29 %, 11.3, 1.78 | 33 %, 9.1, 2.02 | 27 %, 5.7, 2.24 | 11 %, 3.0, 2.71 |
| SH | E_COV | 3 %, 5.4, 1.66 | 10 %, 7.8, 1.57 | 64 %, 5.1, 2.11 | 24 %, 5.0, 2.29 |
| SH | FR_SAFE | 2 %, 5.4, 3.22 | 10 %, 7.8, 2.96 | 60 %, 5.1, 2.93 | 28 %, 4.2, 2.95 |
| SH | E_DART | 3 %, 5.3, 1.80 | 11 %, 6.5, 2.12 | 60 %, 5.3, 2.30 | 27 %, 4.4, 2.36 |
| SH | COV_NOCLUT | 4 %, 5.7, 1.61 | 16 %, 8.3, 1.67 | 61 %, 6.4, 2.06 | 20 %, 5.6, 2.19 |

Tốc độ trung bình trong cột "0 vật" gồm cả đoạn tăng tốc lúc xuất phát và phanh lúc tới đích (tuyến SE chỉ dài
200 m), nên thấp hơn tốc độ hành trình.

## 4. Va chạm còn lại

| kịch bản | va chạm | vật tĩnh | xe đang chạy | vật tĩnh: khối hộp / khối cầu / khối trụ | vật tĩnh: ngoài khung hình | vật tĩnh: đã có trong bộ nhớ | vật tĩnh: lúc đang vòng tránh | vật tĩnh: tốc độ / tốc độ lao vào vật lúc va chạm (trung vị) [m/s] |
|---|---|---|---|---|---|---|---|---|
| SN | 151 | 151 | 0 | 86 / 64 / 1 | 119 | 151 | 151 | 5.5 / 2.1 |
| SH | 299 | 243 | 56 | 114 / 123 / 6 | 192 | 243 | 243 | 5.3 / 2.4 |
| SE | 16 | 16 | 0 | 10 / 6 / 0 | 12 | 16 | 16 | 5.4 / 3.3 |

Va chạm tĩnh trải trên bao nhiêu thế giới:

| kịch bản | số thế giới | thế giới có ≥ 1 va chạm tĩnh | 5 thế giới nhiều nhất (seed: số va chạm) |
|---|---|---|---|
| SN | 60 | 37 | 1: 14, 57: 10, 11: 10, 12: 9, 53: 7 |
| SH | 30 | 30 | 11: 20, 30: 15, 27: 14, 12: 14, 3: 13 |
| SE | 30 | 7 | 30: 5, 9: 4, 6: 3, 12: 1, 15: 1 |

Tốc độ yêu cầu gần như không ảnh hưởng tới tỉ lệ va chạm (Mục 3.4).

* **Vật tĩnh:** khối hộp (nhà, xe, container) và khối cầu (tán cây, bụi cây, đá) chiếm gần hết; thân cây (khối trụ)
  hầu như không.
* **Đã có trong bộ nhớ, lúc đang vòng tránh, phần lớn ngoài khung hình:** UAV đã thấy vật, đang đi vòng để quay về quỹ
  đạo đặt, vật đã ra khỏi khung hình, và UAV vẫn chạm vào vật với tốc độ lao vào 2.1–3.3 m/s. Lớp an toàn phanh 100 Hz
  và MPC chỉ biết vật qua hình trụ trong bộ nhớ, nên nếu chạm thì hình trụ đó nhỏ hơn hoặc lệch so với vật thật ở
  phía UAV đi qua.
* **Giả thuyết (chưa kiểm chứng từng ca):** hình trụ được dựng từ phần vật nhìn thấy trong các khung trước đó; mặt
  bên và mặt sau của khối hộp, phần tán cây chìa ra ngoài không được đo, và khi vật ra khỏi khung hình thì không còn
  được sửa. Cần chạy lại một số ca bằng workflow *Debug case* (ô `cases`) và vẽ bằng `docs/figures/plot_stuck.py` để
  xác nhận trước khi sửa.
* **Xe đang chạy (SH):** 56 va chạm ở trần ≥ 1.5 Hz, ngoài phạm vi (thuật toán coi mọi vật là tĩnh, xe chỉ được
  thấy lại sau mỗi khung).

## 5. Camera

| kịch bản | camera | 1.5–5 Hz: va chạm tĩnh | 1.5–5 Hz: kẹt | 1.5–5 Hz: tới đích | 3 Hz: va chạm tĩnh / kẹt | suy luận mỗi nhiệm vụ (3 Hz, E_COV) | thời gian tới đích (3 Hz, E_COV) [s] |
|---|---|---|---|---|---|---|---|
| SN | Camera Module v2 (62×49°) | 309 / 2880 (10.7 %) | 63 | 2508 / 2880 | 32 / 5 (của 360) | 78 | 53.8 |
| SN | Camera Module 3 (66×41°) | 343 / 2880 (11.9 %) | 48 | 2489 / 2880 | 43 / 8 (của 360) | 77 | 54.3 |
| SN | Camera Module 3 Wide (102×67°) | 64 / 2880 (2.2 %) | 8 | 2808 / 2880 | 7 / 0 (của 360) | 77 | 45.3 |
| SN | Camera Module 3 Wide, mạng 640×360 | 90 / 2880 (3.1 %) | 6 | 2784 / 2880 | 14 / 1 (của 360) | 68 | 48.5 |
| SH | Camera Module v2 (62×49°) | 398 / 1440 (27.6 %) | 53 | 968 / 1440 | 48 / 8 (của 180) | 186 | 96.2 |
| SH | Camera Module 3 (66×41°) | 464 / 1440 (32.2 %) | 41 | 911 / 1440 | 54 / 6 (của 180) | 206 | 100.2 |
| SH | Camera Module 3 Wide (102×67°) | 101 / 1440 (7.0 %) | 5 | 1304 / 1440 | 10 / 0 (của 180) | 134 | 67.0 |
| SH | Camera Module 3 Wide, mạng 640×360 | 157 / 1440 (10.9 %) | 10 | 1244 / 1440 | 15 / 1 (của 180) | 132 | 71.7 |
| SE | Camera Module v2 (62×49°) | 91 / 1440 (6.3 %) | 14 | 1335 / 1440 | 12 / 1 (của 180) | 30 | 34.9 |
| SE | Camera Module 3 (66×41°) | 107 / 1440 (7.4 %) | 11 | 1322 / 1440 | 13 / 4 (của 180) | 28 | 34.9 |
| SE | Camera Module 3 Wide (102×67°) | 5 / 1440 (0.3 %) | 0 | 1435 / 1440 | 1 / 0 (của 180) | 42 | 33.6 |
| SE | Camera Module 3 Wide, mạng 640×360 | 14 / 1440 (1.0 %) | 4 | 1422 / 1440 | 1 / 1 (của 180) | 26 | 34.9 |

Số suy luận của Module 3 Wide 640×360 không so được trực tiếp: mỗi lần suy luận ở 640×360 tốn khoảng 4 lần tính toán và
trễ gấp 4 lần (trung bình 320 ms). Camera hẹp (v2, Module 3) va chạm nhiều vì vật hai bên đường bay và vật đang vòng
qua ra khỏi khung hình sớm hơn, đúng kiểu va chạm của Mục 4.

SE theo loại cảnh và camera (E_COV và FR_SAFE gộp, 1.5–5 Hz). Mỗi ô: va chạm / kẹt (của 240 lượt: 5 thế giới × 3 tốc độ × 8 trần tần số × 2 phương án).

| camera | bãi trống | một cây | đại lộ hàng cây | xe đỗ + xe tải | dãy nhà ven đường | khe phố |
|---|---|---|---|---|---|---|
| Camera Module v2 (62×49°) | 0 / 0 | 1 / 0 | 37 / 3 | 0 / 0 | 0 / 0 | 53 / 11 |
| Camera Module 3 (66×41°) | 0 / 0 | 0 / 0 | 51 / 3 | 0 / 0 | 0 / 0 | 56 / 8 |
| Camera Module 3 Wide (102×67°) | 0 / 0 | 0 / 0 | 1 / 0 | 0 / 0 | 0 / 0 | 4 / 0 |
| Camera Module 3 Wide, mạng 640×360 | 0 / 0 | 0 / 0 | 6 / 0 | 0 / 0 | 0 / 0 | 8 / 4 |

## 6. So với vòng 7 (cùng thế giới, cùng tốc độ yêu cầu, trần 3 Hz)

Vòng 7 dùng hình cầu bao trùm, chưa chụp khi đứng yên; trần 3 Hz khi đó chỉ áp cho E_COV, còn E_DART không bị chặn
(chụp tới 5 khung/s). Mỗi ô: va chạm tĩnh / kẹt / tới đích. Số của vòng 7 lấy từ
[`../archive/results/round7.md`](../archive/results/round7.md) và log `r8*` trong [`../archive/results/raw/`](../archive/results/raw/).

| kịch bản | phương án | vòng 7 | bản chốt |
|---|---|---|---|
| SN (180 lượt) | E_COV | 1 / 8 / 171 | 3 / 0 / 177 |
| SN | FR_SAFE (3 Hz) | 0 / 1 / 179 | 4 / 0 / 176 |
| SN | E_DART | 4 / 2 / 174 | 3 / 0 / 177 |
| SN | COV_NOCLUT | 1 / 3 / 176 | 5 / 0 / 175 |
| SH (90 lượt) | E_COV | 2 / 7 / 80 | 9 / 0 / 78 |
| SH | FR_SAFE (3 Hz) | 0 / 0 / 89 | 1 / 0 / 88 |
| SH | E_DART | 7 / 1 / 80 | 9 / 1 / 78 |
| SH | COV_NOCLUT | 11 / 7 / 71 | 2 / 0 / 86 |

Bản chốt đổi kẹt lấy va chạm: với E_COV, kẹt 15 → 0 / 270 lượt (p = 5·10⁻⁵) nhưng va chạm tĩnh 3 → 12 / 270
(p = 0.033); tổng số lượt thất bại 18 → 12 (p = 0.35). Với FR_SAFE, va chạm tĩnh 0 → 5 / 270 (p = 0.061).

## 7. Hạn chế và việc còn mở

* **Va chạm tĩnh khi vòng tránh vật đã ra khỏi khung hình** (Mục 4) là kiểu thất bại chính, chung cho mọi bộ lập lịch
  và mọi trần tần số ≥ 1.5 Hz: SN khoảng 2 %, SH 6–8 % (E_COV, FR_SAFE), cảnh hành lang (đại lộ, khe phố) với camera
  hẹp 15–23 %. Chưa được sửa trong bản chốt.
* **Vật di chuyển** nằm ngoài phạm vi: va chạm với xe cắt ngang ở SH được tách riêng, không tính vào kết quả chính.
* **Bảng tầm phát hiện R_eff** của các camera được đo trước khi đổi sang hình trụ (cùng bước phân đoạn), chưa đo lại.
* Chỉ mô phỏng; giới hạn của mô hình camera, mạng depth và quadrotor như ở README, Mục 8.
