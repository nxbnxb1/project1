# Lưu trữ — tài liệu và kết quả CŨ

Mọi thứ trong thư mục này là của **các phiên bản trước** của phương pháp hoặc của bộ thử nghiệm.
**Không dùng để trích dẫn kết quả hiện tại.** Chúng được giữ nguyên (không xoá) để tra cứu lịch sử.

Trạng thái hiện tại: [`README.md`](../../README.md) ở gốc repo; kết quả hiện tại:
[`docs/results/round6.md`](../results/round6.md).

## Vì sao lỗi thời

| Nội dung | Phiên bản (commit) | Khác với hiện tại |
|---|---|---|
| [`method/DART_method_VI.tex`](method/DART_method_VI.tex) / `.pdf` — tài liệu phương pháp (bản 3) | `23d9246` | Viết trước phạm vi hiện tại: chưa có mô hình camera thật (preset Raspberry Pi), vật cản lớn, giới hạn vật lý từ mô hình quadrotor, bộ lập lịch coverage (khắc tia, ngân sách 3 Hz), giới hạn tốc độ theo tầm nhìn / mật độ. Kết quả trong Mục 16 là của vòng 3; bộ lập lịch coverage ở Mục 19 mới là đề xuất (bản đã triển khai khác: vùng trống khắc tia + ngân sách) |
| [`figures/`](figures/) — bố trí vật cản S1/S2, một khung perception | `1d823be` | Kịch bản và mô hình camera cũ |
| `results/ablation_simulink.md`, `ablation_simulink_s50.md`, `final_ablation_simulink.md`, `final_sweeps.md`, `sweep_latency.md` | `cc7650d` … `3438b2b` | Perception nhận nhãn thật, tham chiếu thẳng tới đích, chỉ vật cầu, giới hạn 40 s |
| `results/random_worlds.md` (vòng 2–3, thế giới ngẫu nhiên SR) | `d3ed301`, `b377220` | Vật nhỏ và cột mảnh, camera lý tưởng hơn, có vật di chuyển, bộ lập lịch thích nghi E_DART |
| `results/round4.md` (vòng 4 / 4b) | `7d96e58` | Camera 128×96, có cột đèn, tuyến 120 m, tốc độ 2–6 m/s |
| `results/raw/r5*` (vòng 5) | `9491f1d` | Đúng phạm vi hiện tại, nhưng bộ lập lịch coverage còn lỗi coi vùng bị che là đã quan sát; dùng làm cột "trước khi sửa" trong `round6.md` |
| các log còn lại trong `results/raw/` (`ablation*`, `final_*`, `r2*`, `r3*`, `r4*`, `sr*`, `sweep*`) | như các tài liệu tương ứng ở trên | |

## Chạy lại các script cũ

Các script `results/parse_r3.py`, `parse_r4.py`, `parse_sweep.py`, `parse_oracle.py`, `parse_runs.py`
dùng các hàm chung `parse_ablation.py` / `parse_failures.py` nằm ở [`docs/results/`](../results/).
Chạy từ thư mục `docs/archive/results`; lệnh ghi trong các tài liệu cũ dạng
`python3 parse_ablation.py raw/...` nay là `python3 ../../results/parse_ablation.py raw/...`.

Tài liệu phương pháp vẫn được workflow **Docs** biên dịch từ `docs/archive/method/`.
