# Kết quả hiện tại

* [`round7.md`](round7.md) — **kết quả hiện tại**: lưới thử nghiệm đồng bộ (commit `95e551f`, 3240 lượt).
  Mọi trường hợp dùng cùng thế giới, cùng tốc độ yêu cầu (6 / 10 / 15 m/s) và cùng phương án:
  bay thường SN 60 thế giới, kịch bản khó SH 30 thế giới, so sánh 4 camera trên cả hai.
  Kèm tốc độ và tần số chụp theo mật độ vật cản cho mọi lượt.
* `raw/r8*` — log gốc từ GitHub Actions (một dòng mỗi lượt, kèm `DENS`, `FAILINFO`, `WORLD`).
* `parse_results.py` — sinh các bảng (lệnh ở đầu `round7.md`). `parse_failures.py` (phân loại thất bại)
  và `parse_ablation.py` (khoảng tin cậy Wilson) là hàm dùng chung.

Kết quả và tài liệu cũ (vòng 6 trở về trước, tài liệu phương pháp LaTeX): [`../archive/`](../archive/README.md).
