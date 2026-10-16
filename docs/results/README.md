# Kết quả

* [`results.md`](results.md) — kết quả của phiên bản chốt (thuật toán commit `2a536b1`; 36 000 lượt): vật cản hình trụ
  đứng, chụp liên tục khi đứng yên, tần số quét tối đa là ràng buộc cứng. Mọi phần dùng cùng thế giới, cùng tốc độ yêu
  cầu (6 / 10 / 15 m/s) và cùng lưới trần tần số 0.5–5 Hz: bay thường SN 60 thế giới, kịch bản khó SH 30, bối cảnh đời
  thường SE 30; phương án E_COV, FR_SAFE, E_DART, COV_NOCLUT (không giới hạn tốc độ theo mật độ); so sánh 4 camera
  (E_COV, FR_SAFE).
* `raw/f*` — log gốc từ GitHub Actions (mỗi lượt một dòng kết quả, kèm `gap`, `DENS`, `FAILINFO`, `WORLD`): `fsn1–3`,
  `fsh1–3`, `fse` quét tần số; `fncsn`, `fncsh`, `fncse` COV_NOCLUT; `fcsn1–2`, `fcsh1–2`, `fcse` camera.
* `final_tables.py` — sinh mọi bảng của `results.md`: `python3 docs/results/final_tables.py`.
* `raw/collisions/`, `collision_trace.py` — phân tích các va chạm tĩnh ở trần 3 Hz (`results.md`, Mục 4.1): dữ liệu của
  `ci/ci_collision_cases.m` (diag_*, case_*) và `ci/ci_collision_trace.m` (trace_*);
  `python3 docs/results/collision_trace.py`. Hình: `docs/figures/plot_collision.py`, `docs/figures/collisions/`.
* `parse_results.py` — bảng chi tiết cho một nhóm log bất kỳ. `parse_failures.py` (phân loại thất bại) và
  `parse_ablation.py` (khoảng tin cậy Wilson) là hàm dùng chung.

Tài liệu và kết quả các phiên bản trước (vòng 2–7, tài liệu phương pháp LaTeX): [`../archive/`](../archive/README.md).
