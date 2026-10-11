# Kết quả hiện tại

* [`round6.md`](round6.md) — **kết quả hiện tại** (vật cản lớn, camera Raspberry Pi, giới hạn vật lý từ
  mô hình quadrotor, bộ lập lịch coverage sau khi sửa; kèm so sánh camera, tốc độ theo mật độ vật cản
  và kiểm tra giới hạn tốc độ theo mật độ trên thế giới 31–60 và kịch bản khó).
* `raw/r6*`, `raw/r7*` — log gốc từ GitHub Actions (một dòng mỗi lượt, kèm `FAILINFO` / `WORLD`).
* `parse_results.py` — sinh các bảng: `python3 parse_results.py 'raw/r6[abch]_*.log'`.
  `parse_failures.py` (phân loại thất bại) và `parse_ablation.py` (khoảng tin cậy Wilson) là hàm dùng chung.

Kết quả và tài liệu cũ (các vòng trước, tài liệu phương pháp LaTeX): [`../archive/`](../archive/README.md).
