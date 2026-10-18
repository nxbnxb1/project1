# Chuẩn bị bài báo — International Journal of Intelligent Robotics and Applications (Springer, mã 41315)

Tài liệu này tóm tắt các yêu cầu của tạp chí (hướng dẫn tác giả, bản người dùng cung cấp ngày 2026-10-16) và đối chiếu
với những gì repo đã có. Bài viết bằng **tiếng Anh**; tài liệu chuẩn bị này viết bằng tiếng Việt.

Trạng thái: ✅ đã có · 🔧 cần làm từ dữ liệu sẵn có (không chạy thêm mô phỏng) · ❓ cần tác giả cung cấp / quyết định.

## 1. Yêu cầu bắt buộc và trạng thái

| Hạng mục | Yêu cầu của tạp chí | Trạng thái |
|---|---|---|
| Nguyên bản | chưa công bố, không gửi song song nơi khác; mọi đồng tác giả và cơ quan đồng ý | ❓ |
| Tệp nguồn | nộp đủ tệp nguồn chỉnh sửa được (.docx hoặc LaTeX) ở mọi lần nộp / sửa | 🔧 dùng LaTeX, mẫu Springer Nature (`sn-jnl.cls`) |
| Trang tiêu đề | tiêu đề ngắn gọn, đủ thông tin; tên, cơ quan (đơn vị, thành phố, nước), e-mail tác giả liên hệ, ORCID 16 chữ số | ❓ |
| Tóm tắt | 150–250 từ, không có chữ viết tắt chưa định nghĩa, không trích dẫn | 🔧 |
| Từ khoá | 4–6 | 🔧 |
| Tiêu đề mục | hệ thập phân, tối đa 3 cấp | 🔧 |
| Chữ viết tắt | định nghĩa ở lần đầu, dùng nhất quán | 🔧 (UAV, MPC, CBF, QP, FOV, SN/SH/SE, E_COV…) |
| Chú thích chân trang | không chỉ chứa trích dẫn, không chứa thông tin thư mục; dùng footnote, không dùng endnote | 🔧 |
| Lời cảm ơn | mục riêng trên trang tiêu đề; tên tổ chức tài trợ viết đầy đủ | ❓ |
| Đơn vị | SI | ✅ (mã và tài liệu dùng SI) |
| Trích dẫn | số trong ngoặc vuông `[1]`, `[1–3, 7]` | 🔧 |
| Danh mục tài liệu | chỉ công trình đã trích dẫn và đã công bố / được chấp nhận; đánh số liên tục; DOI dạng `https://doi.org/…`; tên tạp chí viết tắt theo ISSN LTWA | 🔧 (Mục 6) |
| Bảng | đánh số Ả Rập, trích theo thứ tự, có tiêu đề giải thích; chú thích bảng bằng chữ thường mũ (hoặc dấu * cho mức ý nghĩa) | 🔧 |
| Hình | Mục 4 | 🔧 |
| Tài liệu bổ sung | gọi là "Online Resource n", tệp `ESM_n.*`, mỗi tệp có chú thích; ghi tiêu đề bài, tạp chí, tác giả, e-mail tác giả liên hệ trong mỗi tệp | 🔧 (Mục 5) |
| Data Availability Statement | bắt buộc với bài nghiên cứu gốc; khuyến khích lưu dữ liệu ở kho công khai có định danh bền vững (DOI) và trích dẫn dữ liệu trong danh mục tài liệu | 🔧 (Mục 7) |
| Statements and Declarations | Competing Interests (bắt buộc), Funding; thêm Data / Code availability, Author contributions; đặt trước danh mục tài liệu | ❓ nội dung, 🔧 khung |
| Khai báo trên hệ thống nộp bài | Author Contribution và Competing Interest phải nhập qua giao diện nộp bài | ❓ |
| Sử dụng LLM / công cụ AI | LLM không được đứng tên tác giả; việc dùng LLM (ngoài "AI assisted copy editing") phải được mô tả trong mục Methods; tác giả chịu trách nhiệm cuối cùng | ❓ (Mục 8) |
| Tiểu sử và ảnh | bài Regular: tiểu sử ngắn + ảnh mỗi tác giả ở cuối bài | ❓ |
| Focused Section | nếu nộp cho một Focused Section: chọn đúng loại bài và ghi trong thư gửi biên tập | ❓ |
| Đạo đức (COPE) | trình bày kết quả rõ ràng, trung thực, không bịa / sửa dữ liệu; trích dẫn đầy đủ; có thể bị yêu cầu cung cấp dữ liệu gốc | ✅ dữ liệu gốc và script lập bảng đã có trong repo |

## 2. Định dạng LaTeX

* Mẫu Springer Nature (`sn-jnl.cls`). Kiểu tài liệu tham khảo dạng số; kiểu `sn-mathphys-num` khớp ví dụ trong hướng
  dẫn ("Hamburger, C.: Quasimonotonicity… Ann. Mat. Pura Appl. 169, 321–354 (1995)") — đối chiếu lại với tệp mẫu khi tải
  template.
* Phương trình bằng môi trường toán LaTeX; bảng bằng `table`/`tabular`; nhấn mạnh bằng chữ nghiêng.
* Thư mục đề xuất: `docs/paper/` gồm `main.tex`, `refs.bib`, `figures/Fig1.eps…`, `ESM/`.

## 3. Cấu trúc bài (tối đa 3 cấp tiêu đề)

Tiêu đề (phương án):
1. *Coverage-triggered depth inference with a hard rate bound for obstacle avoidance of low-cost quadrotors*
2. *When to infer depth: computation-aware perception scheduling for quadrotor obstacle avoidance with delayed monocular depth*

Từ khoá (phương án): perception scheduling; monocular depth estimation; quadrotor; model predictive control; control
barrier function; obstacle avoidance.

| Mục | Nội dung | Nguồn trong repo |
|---|---|---|
| 1 Introduction | bài toán (UAV chi phí thấp, suy luận depth tốn tính toán và có độ trễ), khoảng trống so với prior art, đóng góp | `docs/literature/novelty_positioning.md` (🔧 cập nhật cho phiên bản chốt) |
| 2 Related work | 2.1 độ trễ / tần số nhận thức và an toàn; 2.2 depth đơn mắt; 2.3 lập kế hoạch nhận biết nhận thức, vùng đã biết là trống; 2.4 CBF với lấy mẫu, độ trễ, bất định; 2.5 ước lượng với phép đo trễ | `docs/literature/reading_list.md`, `notes/` |
| 3 System model | quadrotor 6-DOF và giới hạn vật lý; mô hình camera và sai số depth; độ trễ; giả thiết vật cản tĩnh | README Mục 2.1, 2.7; `src/plant`, `src/perception` |
| 4 Method | 4.1 phân đoạn và hình trụ đứng; 4.2 bộ nhớ vật cản bù trễ; 4.3 lập lịch coverage với trần `f_max`; 4.4 giới hạn tốc độ; 4.5 MPC và bộ lọc CBF | README Mục 2; mã nguồn tương ứng |
| 5 Experimental setup | kịch bản SN / SH / SE, lưới 36 000 lượt, phương án đối chứng, camera, độ đo, kiểm định Fisher, cài đặt (MATLAB / Simulink, GitHub Actions) | `docs/results/results.md` đầu tài liệu, README Mục 3.2, 4 |
| 6 Results | 6.1 ràng buộc tần số và tỉ lệ kẹt; 6.2 ảnh hưởng của `f_max`; 6.3 so sánh phương án và chi phí tính toán; 6.4 thích nghi theo mật độ; 6.5 camera | `results.md` Mục 1–5 |
| 7 Discussion | ý nghĩa cho phần cứng, so sánh với vòng trước (nếu cần), phạm vi và hạn chế (chỉ mô phỏng, vật tĩnh, mức va chạm nền chung cho các bộ lập lịch, không có chứng nhận hình thức cho vòng kín) | `results.md` Mục 6–7 |
| 8 Conclusion | | |
| Statements and Declarations | Funding, Competing interests, Data availability, Code availability, Author contributions | Mục 7 |
| References | | Mục 6 |

Đóng góp dự kiến (cần đối chiếu lại với prior art đã đọc toàn văn trước khi chốt câu chữ):
1. Bộ lập lịch suy luận depth theo vùng trống đã quan sát (coverage), với trần tần số cứng và chế độ chụp khi đứng yên.
2. Biểu diễn vật cản bằng hình trụ đứng có đầu chưa quan sát, dùng nhất quán cho CBF, MPC và lập đường vòng.
3. Đánh giá đồng bộ 36 000 lượt (3 kịch bản, 10 mức trần, 3 tốc độ, 4 camera).

Phần phân tích cơ chế va chạm (phát lại, bảng cơ chế, hình phát lại) đã được bỏ khỏi bài theo yêu cầu của tác giả
(2026-10-18); hình cũ lưu ở `figures/archive/Fig7_collision_replay_vi.pdf`, dữ liệu vẫn ở `docs/results/raw/collisions`.

## 4. Hình và bảng

Yêu cầu hình: định dạng vector EPS (ảnh bán sắc TIFF ≥ 300 dpi; kết hợp ≥ 600 dpi; nét bitmap ≥ 1200 dpi), phông nhúng;
tên tệp `Fig1.eps`…; chữ Helvetica / Arial 8–12 pt, cỡ chữ đồng đều; nét ≥ 0.3 pt; rộng 84 mm (một cột) hoặc 174 mm
(toàn trang), cao ≤ 234 mm; **không có tiêu đề trong hình**; chú thích nằm trong văn bản, bắt đầu bằng **Fig. n**, không
có dấu chấm sau số và cuối câu; phần hình ký hiệu a, b, c; màu RGB 8 bit; dùng thêm ký hiệu / kiểu nét ngoài màu (người mù
màu, bản in đen trắng); tương phản chữ ≥ 4.5:1; không nói tới màu trong chú thích nếu bản in đen trắng.

**Bản nộp tiếng Anh** (2026-10-18): [`en/manuscript.tex`](en/manuscript.tex) (PDF: [`en/manuscript.pdf`](en/manuscript.pdf)),
mẫu Springer Nature `sn-jnl.cls` phiên bản 3.1 (12/2024, tải từ trang LaTeX author support của Springer Nature),
một tệp .tex duy nhất (danh mục tài liệu chèn sẵn bằng `build_refs.py --inline`), hình `en/figures/Fig1.pdf`…`Fig6.pdf`.
Đã theo hướng dẫn: tóm tắt 248 từ, không viết tắt chưa định nghĩa; 6 từ khoá; tiêu đề mục tối đa 3 cấp; chú thích
hình "Fig. n" không có dấu câu cuối, không nhắc tới màu; chú thích bảng bằng chữ thường mũ; DOI dạng link đầy đủ;
khai báo dùng công cụ AI trong Mục 5 (tác giả xác nhận); "Statements and Declarations" trước danh mục tài liệu;
Acknowledgements và ORCID ngay sau khối tiêu đề; chỗ cho tiểu sử, ảnh tác giả ở cuối. Các mục chữ đỏ trong ngoặc
vuông là phần tác giả phải điền (Mục 9) hoặc tài liệu còn chờ tải (RAPTOR, Lee et al. CDC 2010, Camera Module v2).
Biên dịch: `pdflatex manuscript` hai lần trong `docs/paper/en`.

Bản thảo tiếng Việt: [`vi/manuscript_vi.tex`](vi/manuscript_vi.tex) (PDF: [`vi/manuscript_vi.pdf`](vi/manuscript_vi.pdf)).
Hình sinh bằng `python3 -I docs/paper/make_figures.py vi` (Fig. 2–6, chỉ từ dữ liệu đã có; `en` ghi bản tiếng Anh vào `en/figures/`) và
`xelatex Fig1_vi.tex` trong `docs/paper/figures/` (Fig. 1, TikZ); danh mục tài liệu sinh bằng
`python3 docs/paper/build_refs.py docs/paper/vi/manuscript_vi.tex docs/paper/vi/refs_auto.tex` từ
[`references.py`](references.py) (chỉ các bài đã đọc toàn văn).

| Hình | Nội dung | Vai trò trong lập luận |
|---|---|---|
| Fig. 1 | kiến trúc vòng kín đa tần số (khối theo phân hệ, nhãn tần số) | vị trí của bộ lập lịch trong vòng kín |
| Fig. 2 | điều kiện phủ: đoạn cần quan sát trong / ngoài vùng trống đã quan sát | định nghĩa trực quan của (5), Hình 2b dùng ở Luận điểm 4 |
| Fig. 3 | một nhiệm vụ SN: quỹ đạo, tốc độ, số suy luận tích luỹ, khoảng cách | cơ chế: số khung theo không gian chưa quan sát |
| Fig. 4 | tỉ lệ va chạm theo `f_max`; tần số chụp thực tế của COV | Luận điểm 1 (ngưỡng, bão hoà) |
| Fig. 5 | tần số chụp và tốc độ theo mật độ vật cản (FR, RA, COV) | Luận điểm 3 và 4 |
| Fig. 6 | tỉ lệ va chạm theo `f_max` cho bốn camera | Luận điểm 5 |

| Bảng | Nội dung | Nguồn |
|---|---|---|
| Table 1 | tham số chính (vật lý, camera, lập lịch, bộ nhớ, MPC, CBF) | `dart_default_config.m`, `dart_camera_preset.m` |
| Table 2 | kịch bản và lưới thử nghiệm | `results.md` đầu tài liệu |
| Table 3 | so sánh bộ lập lịch, gộp 1.5–5 Hz: va chạm tĩnh, p (Fisher) so với COV, kẹt, khung/s | `results.md` Mục 3.1–3.2 |
| Table 4 | cấu hình camera và tỉ lệ va chạm | `results.md` Mục 5 |

## 5. Tài liệu bổ sung (Online Resource)

| Tệp | Nội dung |
|---|---|
| ESM_1.zip | kết quả từng lượt (CSV chuyển từ log `raw/f*`) |
| ESM_2.pdf | toàn bộ bảng của `results.md` (theo từng kịch bản, mức trần, tốc độ, camera) |
| ESM_3.mp4 (tuỳ chọn) | hoạt hình một lượt bay dựng từ JSON đã có (16:9, không nhấp nháy quá 3 lần/giây) |

## 6. Tài liệu tham khảo

* Chỉ trích dẫn các bài **đã đọc toàn văn** trong [`../literature/reading_list.md`](../literature/reading_list.md)
  (ghi chú có số trang và trích nguyên văn trong `../literature/notes/`); không dùng các bài "chưa đọc".
* [`../literature/novelty_positioning.md`](../literature/novelty_positioning.md) được viết cho các phiên bản trước
  (hình cầu, lập lịch E_DART là phương án đề xuất): 🔧 cần định vị lại cho phiên bản chốt (lập lịch coverage, hình trụ
  đứng), chỉ dựa trên bài đã đọc toàn văn — liên quan trực tiếp: Zhuyi [N1], D3 [N13], Pant et al. [N14], RoboRun [N6],
  Falanga et al. [A1], Liu et al. [A6], RAPTOR [C2], FASTER [C3], MonoNav [B5].
* Bài chỉ có trên arXiv: kiểm tra đã được công bố / chấp nhận chưa và dùng bản chính thức nếu có; bản preprint ghi rõ
  định danh arXiv. Bài "đang review" (ví dụ D4) cân nhắc không đưa vào danh mục.
* Bổ sung DOI đầy đủ; tên tạp chí viết tắt theo LTWA.
* Dữ liệu và mã của bài được trích trong danh mục tài liệu (DataCite: tác giả, tiêu đề, kho, năm, DOI).

## 7. Khung các tuyên bố (tác giả hoàn thiện)

* **Funding**: ❓ (ví dụ: "No funding was received for conducting this study.")
* **Competing interests**: ❓ (ví dụ: "The authors have no competing interests to declare that are relevant to the
  content of this article.")
* **Data availability**: dữ liệu kết quả (log từng lượt) và script lập bảng có trong kho GitHub
  `nxbnxb1/project1`; 🔧 đề xuất lưu trữ một bản phát hành cố định trên Zenodo để có DOI và trích dẫn DOI đó.
* **Code availability**: mã MATLAB / Simulink, workflow GitHub Actions — cùng kho và cùng DOI.
* **Author contributions**: ❓ theo CRediT (Conceptualization, Methodology, Software, Formal analysis, Writing…).
* **Ethics / consent**: không áp dụng (không có người hoặc động vật tham gia).

## 8. Khai báo sử dụng công cụ AI

Theo hướng dẫn, việc dùng LLM ngoài mức chỉnh sửa câu chữ phải được mô tả trong mục Methods, và LLM không đứng tên
tác giả. Lịch sử repo ghi nhận mã, phân tích và tài liệu được phát triển với trợ giúp của một trợ lý AI (dòng
`Co-Authored-By` trong commit). ❓ Tác giả quyết định nội dung khai báo; ví dụ: "Parts of the simulation code, the
analysis scripts and the first draft of the text were developed with the assistance of an AI coding assistant (Claude,
Anthropic). The authors reviewed, tested and take full responsibility for all code, results and text."

## 9. Thông tin cần tác giả cung cấp

1. Danh sách tác giả, thứ tự, cơ quan (đơn vị, thành phố, nước), tác giả liên hệ và e-mail, ORCID.
2. Loại bài (Regular paper hay Focused Section) — bài Regular cần tiểu sử và ảnh tác giả.
3. Funding, competing interests, lời cảm ơn.
4. Nội dung khai báo sử dụng công cụ AI (Mục 8).
5. Đồng ý lưu trữ bản phát hành trên Zenodo (DOI) cho dữ liệu và mã.
6. Phương án tiêu đề, giới hạn độ dài mong muốn (hướng dẫn không quy định số trang).

## 10. Thứ tự thực hiện đề xuất

1. Định vị lại tính mới cho phiên bản chốt (chỉ từ bài đã đọc toàn văn).
2. Dựng khung LaTeX theo mẫu Springer Nature, viết Method và Experimental setup từ README / mã nguồn.
3. Script xuất hình cho bài từ dữ liệu sẵn có; bảng từ `final_tables.py`.
4. Viết Results, Discussion (kèm phạm vi và hạn chế), Introduction, Abstract.
5. Tuyên bố, Data / Code availability, tài liệu bổ sung, kiểm tra danh mục tài liệu (DOI, LTWA).
