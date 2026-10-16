# Lưu trữ — tài liệu và kết quả các phiên bản trước

Thư mục này chứa tài liệu và kết quả của **các phiên bản trước** của phương pháp và bộ thử nghiệm, được giữ nguyên để
tra cứu. Các kết quả này không áp dụng cho phiên bản chốt.

Phiên bản chốt: [`README.md`](../../README.md) ở gốc repo; kết quả:
[`docs/results/results.md`](../results/results.md).

## Khác biệt so với phiên bản chốt

| Nội dung | Phiên bản (commit) | Khác biệt |
|---|---|---|
| [`method/DART_method_VI.tex`](method/DART_method_VI.tex) / `.pdf` — tài liệu phương pháp (bản 3) | `23d9246` | Viết trước phạm vi hiện tại: chưa có mô hình camera thật (preset Raspberry Pi), vật cản lớn, giới hạn vật lý từ mô hình quadrotor, bộ lập lịch coverage (khắc tia, ngân sách 3 Hz), giới hạn tốc độ theo tầm nhìn / mật độ. Kết quả trong Mục 16 là của vòng 3; bộ lập lịch coverage ở Mục 19 mới là đề xuất (bản đã triển khai khác: vùng trống khắc tia + ngân sách) |
| [`figures/`](figures/) — bố trí vật cản S1/S2, một khung perception | `1d823be` | Kịch bản và mô hình camera cũ |
| `results/ablation_simulink.md`, `ablation_simulink_s50.md`, `final_ablation_simulink.md`, `final_sweeps.md`, `sweep_latency.md` | `cc7650d` … `3438b2b` | Perception nhận nhãn thật, tham chiếu thẳng tới đích, chỉ vật cầu, giới hạn 40 s |
| `results/random_worlds.md` (vòng 2–3, thế giới ngẫu nhiên SR) | `d3ed301`, `b377220` | Vật nhỏ và cột mảnh, camera lý tưởng hơn, có vật di chuyển, bộ lập lịch thích nghi E_DART |
| `results/round4.md` (vòng 4 / 4b) | `7d96e58` | Camera 128×96, có cột đèn, tuyến 120 m, tốc độ 2–6 m/s |
| `results/raw/r5*` (vòng 5) | `9491f1d` | Cùng phạm vi, nhưng bộ lập lịch coverage khi đó tính cả vùng bị che vào vùng đã quan sát; dùng làm cột đối chứng trong `round6.md` |
| `results/round6.md`, `results/raw/r6*`, `results/raw/r7*` (vòng 6 và các lượt kiểm tra giới hạn tốc độ theo mật độ) | `4a1fcfa`, `f0a4675` | Vật cản là hình cầu; cỡ mẫu không đồng bộ giữa các trường hợp (SN 30 thế giới, SH 15, camera 15 thế giới ở 10 / 15 m/s). Cỡ mẫu SH nhỏ |
| `results/round7.md`, `results/raw/r8*`, `results/figures/stuck/` (vòng 7: lưới đồng bộ 3240 lượt, hình 15 ca kẹt) | `95e551f`, `7103aad` | Vật cản là **hình cầu** bao trùm (phình theo chiều đứng: xe thấp, tán cây cao chắn độ cao bay); bộ lập lịch coverage **không chụp khi UAV đứng yên** (kẹt 8/180 SN, 7/90 SH ở 3 Hz); trần tần số chỉ áp cho coverage (E_DART chụp tới 6 Hz); chưa có bối cảnh SE |
| các log còn lại trong `results/raw/` (`ablation*`, `final_*`, `r2*`, `r3*`, `r4*`, `sr*`, `sweep*`) | như các tài liệu tương ứng ở trên | |

## Chạy lại các script cũ

Các script `results/parse_r3.py`, `parse_r4.py`, `parse_sweep.py`, `parse_oracle.py`, `parse_runs.py`
dùng các hàm chung `parse_ablation.py` / `parse_failures.py` nằm ở [`docs/results/`](../results/).
Chạy từ thư mục `docs/archive/results`; lệnh ghi trong các tài liệu cũ dạng
`python3 parse_ablation.py raw/...` nay là `python3 ../../results/parse_ablation.py raw/...`.

Tài liệu phương pháp vẫn được workflow **Docs** biên dịch từ `docs/archive/method/`.
