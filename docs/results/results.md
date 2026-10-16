# Kết quả thử nghiệm (phiên bản chốt)

**Phiên bản thuật toán:** commit `2a536b1` — vật cản biểu diễn bằng hình trụ đứng, chụp liên tục khi UAV gần như đứng
yên, tần số quét tối đa `f_max` là ràng buộc cứng, bổ sung bối cảnh đời thường SE. Phần COV_NOCLUT và phần camera chạy
trên commit `82a2f03`; commit này chỉ bổ sung tham số quét `camspeedrate` và trình lập bảng, thuật toán không đổi. Mô
tả phương pháp: [`README.md`](../../README.md), Mục 2; cách chạy lại: README, Mục 3.2.

**Quy mô:** 36 000 lượt bay, 15 lần chạy *Sweep* trên GitHub Actions (MATLAB engine), toàn bộ job hoàn tất. Log gốc:
[`raw/f*`](raw/) (mỗi lượt một dòng kết quả, kèm `gap`, `DENS`, `FAILINFO`, `WORLD`). Mọi bảng dưới đây được sinh bằng

```
python3 docs/results/final_tables.py
```

| phần | kịch bản | thế giới (seed) | tốc độ yêu cầu [m/s] | trần tần số `f_max` [Hz] | phương án | camera | số lượt | lần chạy CI |
|---|---|---|---|---|---|---|---|---|
| quét tần số | SN | 1–60 | 6, 10, 15 | 0.5, 1, …, 5 (10 mức) | E_COV, FR_SAFE, E_DART | Module 3 Wide | 5 400 | 38132774498, 38132782216, 38132788927 |
| quét tần số | SH | 1–30 | như trên | như trên | như trên | Module 3 Wide | 2 700 | 38132795484, 38132801458, 38132807445 |
| quét tần số | SE | 1–30 | như trên | như trên | như trên | Module 3 Wide | 2 700 | 38132812918 |
| không giới hạn tốc độ theo mật độ | SN / SH / SE | như trên | như trên | như trên | COV_NOCLUT | Module 3 Wide | 1 800 / 900 / 900 | 38133989659, 38133997977, 38134006363 |
| camera | SN / SH / SE | như trên | như trên | như trên | E_COV, FR_SAFE | v2, Module 3, Module 3 Wide 640×360 | 10 800 / 5 400 / 5 400 | 38134015081, 38134023258 (SN); 38134031683, 38134039247 (SH); 38134046609 (SE) |

Các dòng Module 3 Wide (camera mặc định, mạng 320×180) trong phần camera lấy từ phần quét tần số (cùng thế giới, tốc độ,
trần tần số và phương án). Kết cục của một lượt: tới đích, va chạm, hoặc kẹt (tiến dưới 1 m dọc quỹ đạo đặt trong 60 s);
không giới hạn thời gian bay. "Va chạm tĩnh" là va chạm với vật đứng yên, thuộc phạm vi bài toán; va chạm với phương tiện
cắt ngang quỹ đạo (chỉ có trong SH, seed chia hết cho 3) được thống kê riêng vì phương pháp giả thiết vật cản tĩnh. Kiểm
định thống kê: Fisher chính xác, hai phía.

## 1. Tóm tắt

1. **Ràng buộc tần số.** Trong 36 000 lượt, khoảng cách nhỏ nhất giữa hai lần chụp luôn ≥ 1/`f_max` (dung sai một bước
   điều khiển 10 ms), kể cả ở chế độ khẩn cấp và khi đứng yên.
2. **Tỉ lệ kẹt.** Với `f_max` ≥ 1.5 Hz và camera mặc định: SN 0.1–0.3 %, SH 0.3–1.2 %, SE 0–0.1 %. Ở 3 Hz, số lượt kẹt
   của E_COV giảm từ 15 / 270 (vòng 7) xuống 0 / 270 (p = 5·10⁻⁵).
3. **Ảnh hưởng của trần tần số.** Tỉ lệ va chạm trên SN là 22–31 % ở 0.5 Hz và 4–8 % ở 1 Hz; từ 1.5 Hz mỗi ô còn 1–9 /
   180 lượt và không giảm có ý nghĩa khi tăng tiếp lên 5 Hz. Phần va chạm còn lại do đó không phụ thuộc chủ yếu vào tần
   số chụp (Mục 4).
4. **Chi phí tính toán.** Ở cùng trần, E_COV dùng 0.54–0.72 số lần suy luận của FR_SAFE trên SN, 0.50–0.63 trên SE,
   0.61–0.81 trên SH (1.5–5 Hz). Tỉ lệ va chạm tĩnh gộp 1.5–5 Hz: SN 2.4 % và 2.0 % (p = 0.53), SE 0.3 % và 0.4 %
   (p = 1), SH 8.2 % và 5.8 % (p = 0.098). Ở ngân sách tính toán xấp xỉ bằng nhau (E_COV trần 2f, FR_SAFE trần f), số
   lượt thất bại trên SN là 16 và 35 / 720 (p = 0.0096; chênh lệch tập trung ở cặp 2 Hz – 1 Hz); trên SH (31 và 43 / 360,
   p = 0.18; E_COV dùng nhiều hơn 7–24 % suy luận) và SE (0 và 5 / 360, p = 0.062) khác biệt không có ý nghĩa thống kê.
5. **E_COV so với E_DART.** Ở cùng trần và số suy luận gần bằng nhau (tỉ lệ 0.93–0.98), tỉ lệ va chạm tĩnh của E_COV
   thấp hơn: SN 2.4 % và 3.9 % (p = 0.033), SH 8.2 % và 12.2 % (p = 0.015).
6. **Giới hạn tốc độ theo mật độ.** Không có khác biệt an toàn có ý nghĩa thống kê: COV_NOCLUT có tỉ lệ va chạm tĩnh SN
   2.2 %, SH 7.5 %, SE 0.4 % so với E_COV 2.4 / 8.2 / 0.3 % (p ≥ 0.7); tỉ lệ kẹt trên SH 1.2 % và 0.3 % (p = 0.064);
   thời gian tới đích ngắn hơn (SN, 15 m/s: 33.5 s và 36.4 s). Ở vòng 7 (hình cầu, chưa có trần cứng) khối này giảm va
   chạm trên SH (2 và 11 / 90); với phiên bản chốt, khác biệt này không còn.
7. **Thích nghi theo mật độ.** SN, E_COV, trần 3 Hz, yêu cầu 15 m/s: tốc độ trung bình 11.2 m/s khi không có vật trong
   bán kính 15 m, 8.9 m/s với 1–2 vật, 5.6 m/s với 3–5 vật, 3.8 m/s với ≥ 6 vật; tần số chụp tương ứng tăng từ 1.76 lên
   2.59 khung/s, trong khi FR_SAFE giữ khoảng 3 khung/s.
8. **Camera** (Mục 5). Gộp E_COV và FR_SAFE, 1.5–5 Hz, tỉ lệ va chạm tĩnh trên SN: Module 3 Wide 2.2 %, Module 3 Wide
   640×360 3.1 %, v2 10.7 %, Module 3 11.9 %; trên SH 7.0 / 10.9 / 27.6 / 32.2 %. Góc nhìn ngang là yếu tố chi phối:
   hai camera góc hẹp có tầm phát hiện xa hơn nhưng tỉ lệ va chạm cao hơn 4–5 lần, tỉ lệ kẹt cao hơn 6–11 lần, thời gian
   tới đích dài hơn 15–40 %, và việc tăng trần lên 5 Hz không đưa tỉ lệ va chạm về mức của camera góc rộng. Mạng 640×360
   có độ trễ 320 ms nên tần số chụp thực tế bị giới hạn ở khoảng 2.9 khung/s, với chi phí tính toán gấp khoảng 3 lần.
   Mức tiết kiệm suy luận của E_COV đi kèm an toàn tương đương chỉ với camera góc rộng; với camera góc hẹp hoặc mạng
   640×360, E_COV có tỉ lệ va chạm cao hơn FR_SAFE ở một số ô (p = 0.0005–0.024).
9. **Cơ chế va chạm còn lại** (Mục 4). Với `f_max` ≥ 1.5 Hz và camera mặc định, mọi va chạm tĩnh xảy ra trong chế độ đi
   vòng; 92 % với vật có mặt trong ảnh chụp gần nhất. Va chạm phân bố trên 37 / 60 thế giới SN và cả 30 thế giới SH.
   Phân tích 34 trường hợp tái hiện được ở 3 Hz cho thấy ở 32 trường hợp, phần vật tại điểm va chạm đã có trong bộ nhớ
   vật cản và bị loại khỏi bộ nhớ 0.8–16 s trước va chạm: do quy tắc loại track ngoài khung hình xa hơn 10 m (9), quy
   tắc loại track sau 3 khung không ghép được (8), hoặc do cập nhật từ quan sát một phần vật làm bán kính giảm / tâm dịch
   chuyển (10) hay làm đáy nâng lên / đỉnh hạ xuống qua độ cao bay (5). Tại thời điểm va chạm, khoảng cách ước lượng theo
   bộ nhớ là 0.4–3 m.

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

### 2.3. Bối cảnh đời thường SE

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

SE gồm sáu loại cảnh (bãi trống, một cây giữa tuyến, đại lộ hai hàng cây, xe đỗ ven đường và một xe tải trên tuyến, dãy
nhà ven tuyến, khe phố), mỗi loại 5 thế giới. Từ 1.5 Hz, cả bốn phương án có 0–2 va chạm / 90 lượt mỗi ô.

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

Số khung/s trung bình của FR_SAFE xấp xỉ trung bình các mức trần (3.25 Hz) vì phương án này chụp đúng `f_max`.

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

Cột cuối: tổng số suy luận của E_COV chia cho của phương án so sánh, trên các lượt cả hai cùng tới đích ở trần 3 Hz (cùng
thế giới, cùng tốc độ yêu cầu). Tỉ lệ này giữa E_COV và FR_SAFE theo từng mức trần (cùng cách tính):

Tổng số suy luận của E_COV chia cho của FR_SAFE, trên các lượt mà cả hai cùng tới đích (cùng thế giới, tốc độ, trần).

| kịch bản | 0.5 Hz | 1 Hz | 1.5 Hz | 2 Hz | 2.5 Hz | 3 Hz | 3.5 Hz | 4 Hz | 4.5 Hz | 5 Hz |
|---|---|---|---|---|---|---|---|---|---|---|
| SN | 0.87 | 0.75 | 0.72 | 0.68 | 0.64 | 0.61 | 0.61 | 0.56 | 0.57 | 0.54 |
| SH | 0.85 | 0.88 | 0.81 | 0.79 | 0.78 | 0.75 | 0.73 | 0.66 | 0.63 | 0.61 |
| SE | 0.89 | 0.73 | 0.63 | 0.61 | 0.61 | 0.60 | 0.57 | 0.56 | 0.52 | 0.50 |

### 3.3. Ngân sách tính toán xấp xỉ bằng nhau

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

Thời gian tới đích giảm rõ từ 6 lên 10 m/s và giảm ít hơn từ 10 lên 15 m/s, do tốc độ bị giới hạn bởi tầm nhìn
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

Tốc độ trung bình ở cột "0 vật" bao gồm đoạn tăng tốc khi xuất phát và giảm tốc khi tới đích (tuyến SE dài 200 m).

## 4. Phân tích va chạm

| kịch bản | va chạm | vật tĩnh | xe đang chạy | vật tĩnh: khối hộp / khối cầu / khối trụ | vật tĩnh: có trong ảnh chụp gần nhất | vật tĩnh: lúc đang vòng tránh | vật tĩnh: tốc độ / tốc độ lao vào vật lúc va chạm (trung vị) [m/s] |
|---|---|---|---|---|---|---|---|
| SN | 151 | 151 | 0 | 86 / 64 / 1 | 138 | 151 | 5.5 / 2.1 |
| SH | 299 | 243 | 56 | 114 / 123 / 6 | 225 | 243 | 5.3 / 2.4 |
| SE | 16 | 16 | 0 | 10 / 6 / 0 | 14 | 16 | 5.4 / 3.3 |

"Có trong ảnh chụp gần nhất": một ảnh chụp trong khoảng 1/`f_max` + 0.1 s trước va chạm có ít nhất 12 pixel của vật.

Phân bố va chạm tĩnh theo thế giới:

| kịch bản | số thế giới | thế giới có ≥ 1 va chạm tĩnh | 5 thế giới nhiều nhất (seed: số va chạm) |
|---|---|---|---|
| SN | 60 | 37 | 1: 14, 57: 10, 11: 10, 12: 9, 53: 7 |
| SH | 30 | 30 | 11: 20, 30: 15, 27: 14, 12: 14, 3: 13 |
| SE | 30 | 7 | 30: 5, 9: 4, 6: 3, 12: 1, 15: 1 |

Tỉ lệ va chạm gần như không phụ thuộc tốc độ yêu cầu (Mục 3.4).

### 4.1. Phân tích chi tiết các va chạm ở trần 3 Hz

**Phương pháp.** Toàn bộ 37 va chạm tĩnh ở trần 3 Hz với camera mặc định (cả bốn phương án) được chạy lại bằng MATLAB
trên GitHub Actions:

* ghi trạng thái bộ điều khiển mỗi 0.1 s và so sánh khoảng cách ước lượng theo bộ nhớ với khoảng cách thật (workflow
  *Debug case*, tham số `collisions`, [`ci/ci_collision_cases.m`](../../ci/ci_collision_cases.m); lần chạy 38899652007,
  38899661032, 38899670524);
* ghi mọi thay đổi của bộ nhớ vật cản: cập nhật, tạo mới, loại bỏ (tham số `trace`,
  [`ci/ci_collision_trace.m`](../../ci/ci_collision_trace.m), dùng bản sao vòng lặp mô phỏng có bổ sung phần ghi; lần
  chạy 38901158505, 38901167016, 38901175518).

34 / 37 trường hợp tái hiện đúng thời điểm va chạm; 3 trường hợp còn lại tới đích khi chạy lại (sai khác số học giữa
các máy chạy). Với mỗi trường hợp, bộ nhớ được dựng lại theo thời gian và xác định thời điểm cuối cùng điểm chạm thật
không còn nằm trong hình trụ nào (kể cả phần nới d_s − r_body = 0.25 m), cùng sự kiện gây ra thay đổi đó. Dữ liệu:
[`raw/collisions/`](raw/collisions/); bảng sinh bằng `python3 docs/results/collision_trace.py`. Cột cuối: phát hiện
(vùng depth) trong khung gây ra cập nhật, chọn theo tâm gần nhất.

34 trường hợp va chạm tái hiện được.

| trường hợp | cơ chế loại điểm chạm khỏi bộ nhớ | thời điểm, trước va chạm [s] | bổ sung lại trước va chạm | phát hiện gần nhất khi cập nhật |
|---|---|---|---|---|
| FR_SAFE SE 15 m/s seed 15 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 1.9 | không | - |
| COV_NOCLUT SH 10 m/s seed 30 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 4.8 | có | - |
| COV_NOCLUT SH 15 m/s seed 6 | cập nhật từ quan sát một phần: đỉnh hạ xuống dưới độ cao điểm chạm | 0.8 | không | 14 px, rho 0.1 m, cao 5.7–6.1 m |
| E_COV SH 10 m/s seed 1 | đưa vào bộ nhớ lần đầu 0.1 s trước va chạm | - | - | - |
| E_COV SH 10 m/s seed 15 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 6.9 | có | - |
| E_COV SH 15 m/s seed 28 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 1.1 | không | - |
| E_COV SH 6 m/s seed 1 | cập nhật từ quan sát một phần: đáy nâng lên trên độ cao điểm chạm | 0.9 | không | 609 px, rho 0.9 m, cao 4.3–5.9 m |
| E_COV SH 6 m/s seed 11 | cập nhật từ quan sát một phần: đáy nâng lên trên độ cao điểm chạm | 10.4 | không | 12 px, rho 0.5 m, cao 5.3–6.3 m |
| E_COV SH 6 m/s seed 12 | cập nhật từ quan sát một phần: đáy nâng lên trên độ cao điểm chạm | 1.3 | không | 527 px, rho 1.4 m, cao 2.1–9.2 m |
| E_COV SH 6 m/s seed 19 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 2.2 | không | 543 px, rho 1.4 m, cao 2.0–2.8 m |
| E_COV SH 6 m/s seed 4 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 2.2 | không | - |
| E_DART SH 10 m/s seed 11 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 3.6 | có | 285 px, rho 1.6 m, cao -2.4–2.4 m |
| E_DART SH 10 m/s seed 12 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 1.3 | có | - |
| E_DART SH 10 m/s seed 18 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 1.5 | có | - |
| E_DART SH 10 m/s seed 2 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 11.0 | không | 45 px, rho 3.7 m, cao -1.3–17.2 m |
| E_DART SH 10 m/s seed 24 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 1.1 | có | - |
| E_DART SH 10 m/s seed 27 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 14.4 | không | 891 px, rho 0.4 m, cao 1.3–2.1 m |
| E_DART SH 10 m/s seed 3 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 1.9 | có | - |
| E_DART SH 15 m/s seed 30 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 1.3 | có | - |
| E_DART SH 6 m/s seed 12 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 6.8 | không | 4544 px, rho 1.9 m, cao -0.3–9.1 m |
| FR_SAFE SH 15 m/s seed 20 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 3.5 | không | 2427 px, rho 1.6 m, cao -0.2–6.2 m |
| COV_NOCLUT SN 10 m/s seed 27 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 2.2 | có | - |
| COV_NOCLUT SN 10 m/s seed 6 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 4.3 | không | 169 px, rho 1.1 m, cao 0.1–4.9 m |
| COV_NOCLUT SN 6 m/s seed 1 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 2.5 | không | - |
| COV_NOCLUT SN 6 m/s seed 13 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 3.3 | không | - |
| E_COV SN 15 m/s seed 21 | cập nhật từ quan sát một phần: đáy nâng lên trên độ cao điểm chạm | 10.7 | không | 782 px, rho 0.4 m, cao 6.0–10.1 m |
| E_COV SN 6 m/s seed 13 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 3.3 | không | - |
| E_COV SN 6 m/s seed 36 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 16.4 | không | 4722 px, rho 0.4 m, cao 2.6–4.8 m |
| E_DART SN 10 m/s seed 42 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 9.8 | không | - |
| E_DART SN 15 m/s seed 12 | loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 1.3 | có | - |
| E_DART SN 6 m/s seed 54 | không có trong bộ nhớ trước va chạm | - | - | - |
| FR_SAFE SN 10 m/s seed 42 | loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 4.2 | không | - |
| FR_SAFE SN 10 m/s seed 55 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 1.3 | không | 3558 px, rho 1.6 m, cao 0.5–5.2 m |
| FR_SAFE SN 15 m/s seed 24 | cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 14.3 | không | 84 px, rho 3.4 m, cao 1.9–14.6 m |

| cơ chế | số trường hợp |
|---|---|
| cập nhật từ quan sát một phần: bán kính giảm / tâm dịch chuyển | 10 |
| loại bỏ: ngoài khung hình và cách UAV > 10 m (trk.forget_dist) | 9 |
| loại bỏ: 3 khung liên tiếp không ghép với phát hiện nào (trk.n_miss) | 8 |
| cập nhật từ quan sát một phần: đáy nâng lên trên độ cao điểm chạm | 4 |
| cập nhật từ quan sát một phần: đỉnh hạ xuống dưới độ cao điểm chạm | 1 |
| đưa vào bộ nhớ lần đầu 0.1 s trước va chạm | 1 |
| không có trong bộ nhớ trước va chạm | 1 |

**Nhận xét.**

* Ở 22 trường hợp, phần vật tại điểm chạm không được bổ sung lại vào bộ nhớ trước va chạm; khoảng cách ước lượng theo
  bộ nhớ tại thời điểm va chạm là 0.4–3 m, nên MPC và CBF không có ràng buộc tương ứng. Ở 11 trường hợp, phần vật đó
  được đưa (lại) vào bộ nhớ 0.1–0.7 s trước va chạm (một trường hợp 2.2 s ở tốc độ 9.8 m/s), ngắn hơn thời gian
  phanh cần thiết; lớp CBF hoạt động ở giới hạn với biến bù lớn.
* Vật vẫn nằm trong trường nhìn: ảnh mới chỉ chứa một phần vật (phần sát bên UAV nằm ngoài khung hoặc ở mép ảnh), và
  bộ nhớ cập nhật theo hình học của phần quan sát được.
* Ba quy tắc của bộ nhớ (`src/estimation/dart_tracks_process_msg.m`, `dart_tracks_prune.m`) liên quan đến cơ chế này:
  1. track có tâm ngoài trường nhìn và cách UAV hơn `trk.forget_dist` = 10 m bị loại, trong khi đường vòng có thể quay
     lại gần vật đó;
  2. track được dự đoán nằm trong ảnh nhưng không ghép với phát hiện nào trong `trk.n_miss` = 3 khung liên tiếp bị loại;
     với vật lớn được phủ bằng nhiều hình trụ, cách chia vùng thay đổi theo khoảng cách (`cam.r_chunk` = 2 m + 0.1 ×
     khoảng cách) nên track cũ có thể không còn ghép được dù vật vẫn tồn tại;
  3. khi ghép, bán kính được làm mượt về phía bán kính của phát hiện (`trk.rho_alpha` = 0.3), tâm được cập nhật bằng
     Kalman, và một đầu chưa quan sát (kéo tới mặt đất / lên cao) được thay ngay bằng đáy / đỉnh của phần quan sát được.
* Hình minh hoạ ([`docs/figures/plot_collision.py`](../figures/plot_collision.py)):
  [đáy hình trụ nâng lên (tán cây)](../figures/collisions/SH_E_COV_v6_s1.png),
  [loại sau 3 khung không ghép được (góc nhà)](../figures/collisions/SH_E_COV_v6_s4.png),
  [loại do ngoài khung hình và xa hơn 10 m (khối hộp)](../figures/collisions/SN_E_COV_v6_s13.png).
* **Phương tiện cắt ngang (SH):** 56 va chạm ở trần ≥ 1.5 Hz, ngoài phạm vi bài toán (phương pháp coi mọi vật là tĩnh;
  phương tiện chỉ được cập nhật vị trí theo từng khung).

## 5. Camera

Phần camera chạy E_COV và FR_SAFE với ba camera trên cùng lưới của phần chính (cùng thế giới, 3 tốc độ, 10 mức trần);
camera mặc định lấy từ phần quét tần số. Mỗi camera: SN 3 600 lượt, SH 1 800, SE 1 800. Thông số dẫn xuất
(`dart_camera_preset`, `dart_derive_limits`; R_eff: tầm tin cậy với vật bán kính 1 m; v_max: tốc độ tối đa để quỹ đạo
không rời khỏi ảnh khi UAV chúi mũi; góc dọc tính theo ảnh đưa vào mạng):

| camera | ảnh vào mạng | góc nhìn ngang × dọc | suy luận (trung bình) | R_eff | v_max | tần số chụp tối đa thực tế |
|---|---|---|---|---|---|---|
| Camera Module v2 | 280×210 | 62×49° | 82 ms | 30 m | 13.1 m/s | 5 Hz |
| Camera Module 3 | 320×180 | 66×40° | 80 ms | 30 m | 10.7 m/s | 5 Hz |
| Camera Module 3 Wide (mặc định) | 320×180 | 102×70° | 80 ms | 26 m | 15 m/s | 5 Hz |
| Camera Module 3 Wide, mạng 640×360 | 640×360 | 102×70° | 320 ms (tính toán ×4) | 30 m | 15 m/s | ≈ 2.9 Hz |

| kịch bản | camera | 1.5–5 Hz: va chạm tĩnh | 1.5–5 Hz: kẹt | 1.5–5 Hz: tới đích | 3 Hz: va chạm tĩnh / kẹt | suy luận mỗi nhiệm vụ (3 Hz, E_COV) | thời gian tới đích (3 Hz, E_COV) [s] |
|---|---|---|---|---|---|---|---|
| SN | Camera Module v2 (62°) | 309 / 2880 (10.7 %) | 63 | 2508 / 2880 | 32 / 5 (của 360) | 78 | 53.8 |
| SN | Camera Module 3 (66°) | 343 / 2880 (11.9 %) | 48 | 2489 / 2880 | 43 / 8 (của 360) | 77 | 54.3 |
| SN | Camera Module 3 Wide (102°) | 64 / 2880 (2.2 %) | 8 | 2808 / 2880 | 7 / 0 (của 360) | 77 | 45.3 |
| SN | Camera Module 3 Wide (102°), mạng 640×360 | 90 / 2880 (3.1 %) | 6 | 2784 / 2880 | 14 / 1 (của 360) | 68 | 48.5 |
| SH | Camera Module v2 (62°) | 398 / 1440 (27.6 %) | 53 | 968 / 1440 | 48 / 8 (của 180) | 186 | 96.2 |
| SH | Camera Module 3 (66°) | 464 / 1440 (32.2 %) | 41 | 911 / 1440 | 54 / 6 (của 180) | 206 | 100.2 |
| SH | Camera Module 3 Wide (102°) | 101 / 1440 (7.0 %) | 5 | 1304 / 1440 | 10 / 0 (của 180) | 134 | 67.0 |
| SH | Camera Module 3 Wide (102°), mạng 640×360 | 157 / 1440 (10.9 %) | 10 | 1244 / 1440 | 15 / 1 (của 180) | 132 | 71.7 |
| SE | Camera Module v2 (62°) | 91 / 1440 (6.3 %) | 14 | 1335 / 1440 | 12 / 1 (của 180) | 30 | 34.9 |
| SE | Camera Module 3 (66°) | 107 / 1440 (7.4 %) | 11 | 1322 / 1440 | 13 / 4 (của 180) | 28 | 34.9 |
| SE | Camera Module 3 Wide (102°) | 5 / 1440 (0.3 %) | 0 | 1435 / 1440 | 1 / 0 (của 180) | 42 | 33.6 |
| SE | Camera Module 3 Wide (102°), mạng 640×360 | 14 / 1440 (1.0 %) | 4 | 1422 / 1440 | 1 / 1 (của 180) | 26 | 34.9 |

Tỉ lệ va chạm tĩnh theo trần tần số:

| kịch bản | camera | 0.5 Hz | 1 Hz | 1.5 Hz | 2 Hz | 2.5 Hz | 3 Hz | 3.5 Hz | 4 Hz | 4.5 Hz | 5 Hz | FR_SAFE ở 5 Hz: khung/s thật |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SN | Camera Module v2 (62°) | 55.8 % | 33.6 % | 19.2 % | 13.9 % | 11.1 % | 8.9 % | 8.3 % | 7.8 % | 10.3 % | 6.4 % | 5.01 |
| SN | Camera Module 3 (66°) | 61.4 % | 34.7 % | 23.6 % | 14.4 % | 13.3 % | 11.9 % | 10.6 % | 7.2 % | 6.9 % | 7.2 % | 5.01 |
| SN | Camera Module 3 Wide (102°) | 25.0 % | 5.6 % | 3.3 % | 2.8 % | 1.7 % | 1.9 % | 1.7 % | 1.9 % | 2.2 % | 2.2 % | 5.01 |
| SN | Camera Module 3 Wide (102°), mạng 640×360 | 30.8 % | 8.9 % | 5.3 % | 4.7 % | 3.3 % | 3.9 % | 2.2 % | 1.4 % | 1.4 % | 2.8 % | 2.92 |
| SH | Camera Module v2 (62°) | 89.4 % | 61.7 % | 45.6 % | 36.7 % | 28.3 % | 26.7 % | 23.3 % | 21.7 % | 21.7 % | 17.2 % | 5.01 |
| SH | Camera Module 3 (66°) | 88.9 % | 73.3 % | 52.2 % | 46.1 % | 33.9 % | 30.0 % | 29.4 % | 23.9 % | 22.2 % | 20.0 % | 5.01 |
| SH | Camera Module 3 Wide (102°) | 53.3 % | 14.4 % | 9.4 % | 7.2 % | 10.0 % | 5.6 % | 3.9 % | 9.4 % | 5.0 % | 5.6 % | 5.01 |
| SH | Camera Module 3 Wide (102°), mạng 640×360 | 56.1 % | 25.6 % | 16.7 % | 13.3 % | 11.7 % | 8.3 % | 8.3 % | 7.2 % | 11.1 % | 10.6 % | 2.91 |
| SE | Camera Module v2 (62°) | 31.7 % | 21.1 % | 14.4 % | 7.8 % | 5.6 % | 6.7 % | 3.3 % | 3.9 % | 3.3 % | 5.6 % | 5.01 |
| SE | Camera Module 3 (66°) | 23.9 % | 17.8 % | 15.0 % | 11.7 % | 5.6 % | 7.2 % | 6.1 % | 4.4 % | 5.6 % | 3.9 % | 5.02 |
| SE | Camera Module 3 Wide (102°) | 5.0 % | 2.8 % | 0.6 % | 0.6 % | 1.1 % | 0.6 % | 0.0 % | 0.0 % | 0.0 % | 0.0 % | 5.01 |
| SE | Camera Module 3 Wide (102°), mạng 640×360 | 13.9 % | 3.3 % | 1.1 % | 1.7 % | 1.7 % | 0.6 % | 0.6 % | 0.0 % | 1.1 % | 1.1 % | 2.92 |

E_COV so với FR_SAFE theo camera:

Mỗi ô: va chạm tĩnh (tỉ lệ) / kẹt / suy luận mỗi nhiệm vụ (trung vị, lượt tới đích) / khung/s trung bình. p: Fisher hai phía trên va chạm tĩnh.

| kịch bản | camera | E_COV | FR_SAFE | p | thời gian tới đích E_COV / FR_SAFE (trung vị) [s] |
|---|---|---|---|---|---|
| SN | Camera Module v2 (62°) | 12.8 % / 37 / 80 / 1.74 | 8.7 % / 26 / 167 / 3.23 | 0.00046 | 53.6 / 53.3 |
| SN | Camera Module 3 (66°) | 12.2 % / 26 / 83 / 1.73 | 11.7 % / 22 / 172 / 3.23 | 0.73 | 53.6 / 53.6 |
| SN | Camera Module 3 Wide (102°) | 2.4 % / 3 / 84 / 1.89 | 2.0 % / 5 / 146 / 3.23 | 0.53 | 46.5 / 45.8 |
| SN | Camera Module 3 Wide (102°), mạng 640×360 | 3.9 % / 3 / 67 / 1.44 | 2.4 % / 3 / 121 / 2.53 | 0.024 | 49.6 / 50.3 |
| SH | Camera Module v2 (62°) | 30.0 % / 29 / 219 / 2.24 | 25.3 % / 24 / 314 / 3.22 | 0.052 | 97.0 / 95.5 |
| SH | Camera Module 3 (66°) | 36.1 % / 21 / 216 / 2.27 | 28.3 % / 20 / 309 / 3.23 | 0.0019 | 94.6 / 89.9 |
| SH | Camera Module 3 Wide (102°) | 8.2 % / 2 / 135 / 2.16 | 5.8 % / 3 / 204 / 3.22 | 0.098 | 67.2 / 64.5 |
| SH | Camera Module 3 Wide (102°), mạng 640×360 | 13.6 % / 7 / 134 / 1.83 | 8.2 % / 3 / 186 / 2.52 | 0.0013 | 74.2 / 73.0 |
| SE | Camera Module v2 (62°) | 5.6 % / 7 / 28 / 1.39 | 7.1 % / 7 / 99 / 3.23 | 0.28 | 34.9 / 34.9 |
| SE | Camera Module 3 (66°) | 8.3 % / 4 / 28 / 1.35 | 6.5 % / 7 / 101 / 3.23 | 0.23 | 34.7 / 34.0 |
| SE | Camera Module 3 Wide (102°) | 0.3 % / 0 / 42 / 1.66 | 0.4 % / 0 / 97 / 3.23 | 1 | 32.7 / 32.5 |
| SE | Camera Module 3 Wide (102°), mạng 640×360 | 1.2 % / 3 / 26 / 1.21 | 0.7 % / 1 / 75 / 2.53 | 0.42 | 34.9 / 34.9 |

Theo tốc độ yêu cầu:

Mỗi ô: va chạm tĩnh (tỉ lệ) / kẹt / thời gian tới đích trung vị [s].

| kịch bản | camera | 6 m/s | 10 m/s | 15 m/s | so với Module 3 Wide: p (va chạm tĩnh, mọi tốc độ) |
|---|---|---|---|---|---|
| SN | Camera Module v2 (62°) | 9.0 % / 28 / 64.3 | 8.4 % / 17 / 44.5 | 14.8 % / 18 / 39.2 | 4.9e-42 |
| SN | Camera Module 3 (66°) | 8.1 % / 18 / 64.0 | 12.3 % / 22 / 43.5 | 15.3 % / 8 / 43.6 | 2.3e-50 |
| SN | Camera Module 3 Wide (102°) | 2.8 % / 6 / 59.0 | 2.0 % / 0 / 40.1 | 1.9 % / 2 / 36.6 | - |
| SN | Camera Module 3 Wide (102°), mạng 640×360 | 2.5 % / 4 / 62.2 | 3.1 % / 1 / 42.7 | 3.8 % / 1 / 38.2 | 0.041 |
| SH | Camera Module v2 (62°) | 24.6 % / 18 / 112.5 | 27.3 % / 15 / 90.0 | 31.0 % / 20 / 85.1 | 9.3e-51 |
| SH | Camera Module 3 (66°) | 20.8 % / 18 / 106.9 | 33.1 % / 14 / 86.7 | 42.7 % / 9 / 82.1 | 6.1e-69 |
| SH | Camera Module 3 Wide (102°) | 7.7 % / 3 / 75.0 | 6.9 % / 2 / 61.3 | 6.5 % / 0 / 59.0 | - |
| SH | Camera Module 3 Wide (102°), mạng 640×360 | 10.8 % / 3 / 85.0 | 10.6 % / 5 / 69.4 | 11.2 % / 2 / 66.4 | 0.00032 |
| SE | Camera Module v2 (62°) | 5.4 % / 9 / 36.7 | 6.7 % / 1 / 23.9 | 6.9 % / 4 / 22.1 | 4.4e-22 |
| SE | Camera Module 3 (66°) | 5.0 % / 8 / 37.0 | 8.8 % / 1 / 24.3 | 8.5 % / 2 / 24.0 | 8.4e-27 |
| SE | Camera Module 3 Wide (102°) | 0.0 % / 0 / 36.0 | 0.0 % / 0 / 24.9 | 1.0 % / 0 / 22.7 | - |
| SE | Camera Module 3 Wide (102°), mạng 640×360 | 0.2 % / 2 / 37.9 | 1.9 % / 0 / 24.8 | 0.8 % / 2 / 22.2 | 0.063 |

SE theo loại cảnh và camera (E_COV và FR_SAFE gộp, 1.5–5 Hz). Mỗi ô: va chạm / kẹt (của 240 lượt: 5 thế giới × 3 tốc độ × 8 trần tần số × 2 phương án).

| camera | bãi trống | một cây | đại lộ hàng cây | xe đỗ + xe tải | dãy nhà ven đường | khe phố |
|---|---|---|---|---|---|---|
| Camera Module v2 (62°) | 0 / 0 | 1 / 0 | 37 / 3 | 0 / 0 | 0 / 0 | 53 / 11 |
| Camera Module 3 (66°) | 0 / 0 | 0 / 0 | 51 / 3 | 0 / 0 | 0 / 0 | 56 / 8 |
| Camera Module 3 Wide (102°) | 0 / 0 | 0 / 0 | 1 / 0 | 0 / 0 | 0 / 0 | 4 / 0 |
| Camera Module 3 Wide (102°), mạng 640×360 | 0 / 0 | 0 / 0 | 6 / 0 | 0 / 0 | 0 / 0 | 8 / 4 |

**Nhận xét.**

* **Góc nhìn ngang chi phối tỉ lệ va chạm hơn tầm phát hiện.** Hai camera góc hẹp có R_eff 30 m (camera mặc định
  26 m) nhưng tỉ lệ va chạm cao hơn 4.9–5.4 lần trên SN (10.7 % và 11.9 % so với 2.2 %, p < 10⁻⁴⁰), 3.9–4.6 lần trên
  SH, và 6–7 % trên SE, gần như toàn bộ ở hai loại cảnh có vật sát hai bên tuyến (đại lộ, khe phố).
* **Tăng tần số không bù được góc nhìn hẹp.** Với camera góc hẹp, tỉ lệ va chạm giảm theo trần nhưng ở 5 Hz vẫn là
  6–7 % (SN) và 17–20 % (SH), cao hơn camera góc rộng ở 1.5 Hz. Camera góc rộng đạt mức thấp từ khoảng 2 Hz.
* **Cùng cơ chế va chạm:** với mọi camera, ≥ 99.7 % va chạm tĩnh xảy ra trong chế độ đi vòng và 86–100 % với vật có
  trong ảnh chụp gần nhất (cơ chế của Mục 4.1). Với góc nhìn hẹp, vật bên cạnh UAV rời khung hình sớm hơn và mỗi ảnh chứa
  một phần nhỏ hơn của vật, nên các quy tắc loại bỏ và cập nhật từ quan sát một phần được kích hoạt thường xuyên hơn.
* **Thời gian và tỉ lệ kẹt:** camera góc hẹp có thời gian tới đích dài hơn 15 % (SN, 53.6 s và 46.5 s) và 42 % (SH,
  95 s và 67 s), tỉ lệ kẹt cao hơn 6–11 lần, v_max giới hạn ở 10.7–13.1 m/s. Tỉ lệ va chạm của chúng tăng theo tốc độ
  yêu cầu (Module 3, SH: 21 % ở 6 m/s, 43 % ở 15 m/s), trong khi của camera góc rộng gần như không đổi.
* **Mạng 640×360:** mỗi lần suy luận tốn gấp 4 lần và trễ 320 ms, nên tần số chụp thực tế bị giới hạn ở khoảng 2.9
  khung/s; tỉ lệ va chạm cao hơn mạng 320×180 (SN 3.1 % và 2.2 %, p = 0.041; SH 10.9 % và 7.0 %, p = 0.0003) với tổng
  chi phí tính toán gấp khoảng 3 lần (E_COV, SN: 67 lần suy luận × 4 so với 84).
* **E_COV theo camera:** với camera góc rộng, E_COV đạt tỉ lệ va chạm tương đương FR_SAFE trên SN, SE (p ≥ 0.5) với ít
  hơn 28–50 % suy luận ở cùng trần (Mục 3.2). Với camera góc hẹp hoặc mạng 640×360, E_COV có tỉ lệ va chạm cao hơn
  FR_SAFE ở một số ô (v2, SN: 12.8 % và 8.7 %, p = 0.0005; Module 3, SH: 36.1 % và 28.3 %, p = 0.002; 640×360: SN
  p = 0.024, SH p = 0.001). Tiêu chí của E_COV dựa trên vùng trống đã quan sát; vùng này nhỏ hơn (góc hẹp) hoặc cập nhật
  chậm hơn (độ trễ lớn), nên số lần chụp ít hơn đi kèm tỉ lệ va chạm cao hơn.
* **Khuyến nghị phần cứng:** camera góc rộng (≥ 100° ngang) với mạng depth độ phân giải thấp, độ trễ thấp (320×180,
  khoảng 80 ms).

## 6. So sánh với vòng 7 (cùng thế giới, cùng tốc độ yêu cầu, trần 3 Hz)

Vòng 7 dùng hình cầu bao, chưa có chế độ chụp khi đứng yên; trần 3 Hz khi đó chỉ áp dụng cho E_COV, E_DART không bị
giới hạn (tới 5 khung/s). Mỗi ô: va chạm tĩnh / kẹt / tới đích. Số liệu vòng 7 lấy từ
[`../archive/results/round7.md`](../archive/results/round7.md) và log `r8*` trong
[`../archive/results/raw/`](../archive/results/raw/).

| kịch bản | phương án | vòng 7 | phiên bản chốt |
|---|---|---|---|
| SN (180 lượt) | E_COV | 1 / 8 / 171 | 3 / 0 / 177 |
| SN | FR_SAFE (3 Hz) | 0 / 1 / 179 | 4 / 0 / 176 |
| SN | E_DART | 4 / 2 / 174 | 3 / 0 / 177 |
| SN | COV_NOCLUT | 1 / 3 / 176 | 5 / 0 / 175 |
| SH (90 lượt) | E_COV | 2 / 7 / 80 | 9 / 0 / 78 |
| SH | FR_SAFE (3 Hz) | 0 / 0 / 89 | 1 / 0 / 88 |
| SH | E_DART | 7 / 1 / 80 | 9 / 1 / 78 |
| SH | COV_NOCLUT | 11 / 7 / 71 | 2 / 0 / 86 |

Với E_COV (SN và SH gộp), số lượt kẹt giảm từ 15 xuống 0 / 270 (p = 5·10⁻⁵), số va chạm tĩnh tăng từ 3 lên 12 / 270
(p = 0.033), tổng số lượt không tới đích (không tính phương tiện cắt ngang) giảm từ 18 xuống 12 (p = 0.35). Với FR_SAFE,
số va chạm tĩnh tăng từ 0 lên 5 / 270 (p = 0.061).

## 7. Phạm vi và hạn chế

* **Cơ chế cập nhật bộ nhớ vật cản** (Mục 4.1) là nguyên nhân của phần lớn va chạm tĩnh còn lại ở mọi bộ lập lịch và mọi
  trần ≥ 1.5 Hz: tỉ lệ khoảng 2 % trên SN, 6–8 % trên SH (E_COV, FR_SAFE), 15–23 % ở cảnh hành lang (đại lộ, khe phố) với
  camera góc hẹp. Hướng phát triển: chỉ loại phần vật đã quan sát khỏi bộ nhớ khi ảnh depth cho thấy vùng đó trống (tia
  đi xuyên qua), thay vì khi vật rời khung hình hoặc khi một ảnh chỉ chứa một phần vật.
* **Vật di chuyển** nằm ngoài phạm vi: va chạm với phương tiện cắt ngang trong SH được thống kê riêng.
* **Bảng tầm phát hiện R_eff** của các camera được đo với cùng bước phân đoạn nhưng trước khi chuyển sang mô hình hình
  trụ.
* Kết quả thu được bằng mô phỏng; giả thiết về camera, mạng depth và quadrotor như ở README, Mục 8.
