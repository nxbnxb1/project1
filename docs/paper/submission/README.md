# Hồ sơ nộp bài — International Journal of Intelligent Robotics and Applications (Springer)

Nộp qua Editorial Manager (nút "Submit manuscript" trên https://link.springer.com/journal/41315).

## Tệp tải lên

| Tệp | Loại mục trên Editorial Manager | Ghi chú |
|---|---|---|
| `IJIRA_submission_Nguyen.zip` | Manuscript (LaTeX source, zip) | gồm `manuscript.tex`, `sn-jnl.cls`, `manuscript.pdf`, `figures/Fig1–Fig6.pdf`, `figures/author_photo.png`; đã thử biên dịch từ zip, cả khi bị làm phẳng thư mục |
| `cover_letter.pdf` | Cover Letter | nguồn: `cover_letter.tex` |

Nếu hệ thống không nhận zip cho mục Manuscript, tải từng tệp trong zip:

| Tệp | Loại mục |
|---|---|
| `manuscript.tex` | Manuscript (LaTeX source file) |
| `sn-jnl.cls` | LaTeX supplementary / support file |
| `Fig1.pdf` … `Fig6.pdf` | Figure (đúng thứ tự 1–6) |
| `author_photo.png` | Author photo (hoặc Figure / Supplementary nếu không có mục riêng) |
| `manuscript.pdf` | Manuscript PDF (nếu có mục này; hệ thống thường tự dựng PDF từ LaTeX) |

Sau khi tải lên, Editorial Manager dựng một bản PDF: kiểm tra bản đó (hình, bảng, tài liệu tham khảo) trước khi bấm Approve.

## Thông tin gõ vào form

Chép từ [`form_answers.md`](form_answers.md): tiêu đề, tiêu đề ngắn, tác giả và cơ quan, e-mail, ORCID, tóm tắt
(246 từ), từ khoá, Funding, Competing interests, Author contributions, Data / Code availability. Theo hướng dẫn của tạp
chí, Author Contribution và Competing Interest **phải** nhập qua giao diện nộp bài (chỉ thông tin trong giao diện được
dùng cho bản xuất bản).

## Lựa chọn trên form (tác giả tự quyết)

* Loại bài: Regular paper (bài có tiểu sử và ảnh tác giả ở cuối) hoặc Focused Section (nếu có lời mời, cần ghi trong
  thư gửi biên tập).
* Đề xuất / loại trừ người phản biện: không bắt buộc; nếu đề xuất, phải là người độc lập và cần e-mail cơ quan.
* Cover letter khẳng định bài chưa công bố và không gửi song song nơi khác — tác giả xác nhận trước khi nộp.

## Dựng lại

```
python3 -I docs/paper/make_figures.py en                       # Fig. 2–6
cd docs/paper/en/figures && xelatex Fig1.tex                    # Fig. 1
python3 docs/paper/build_refs.py docs/paper/en/manuscript.tex --inline
cd docs/paper/en && pdflatex manuscript && pdflatex manuscript
cd docs/paper/submission && pdflatex cover_letter
```
