# Kết quả hiện tại

* [`results.md`](results.md) — **kết quả của lưới chốt** (commit `2a536b1`): vật cản hình trụ đứng, chụp liên tục khi
  đứng yên, tần số quét tối đa là trần cứng. Mọi trường hợp dùng cùng thế giới, cùng tốc độ yêu cầu (6 / 10 / 15 m/s):
  bay thường SN 60 thế giới, kịch bản khó SH 30, bối cảnh siêu dễ SE 30; quét trần tần số 0.5–5 Hz cho E_COV, FR_SAFE,
  E_DART, bản không giới hạn tốc độ theo mật độ (COV_NOCLUT), và so sánh 4 camera (E_COV, FR_SAFE) — tất cả trên
  cùng lưới tần số. (Đang chạy; tệp này được tạo khi xong.)
* `raw/fin*` — log gốc từ GitHub Actions (một dòng mỗi lượt, kèm `gap`, `DENS`, `FAILINFO`, `WORLD`).
* `parse_results.py` — sinh các bảng (lệnh ở đầu `results.md`). `parse_failures.py` (phân loại thất bại) và
  `parse_ablation.py` (khoảng tin cậy Wilson) là hàm dùng chung.

Kết quả và tài liệu cũ (vòng 7 trở về trước, tài liệu phương pháp LaTeX): [`../archive/`](../archive/README.md).
