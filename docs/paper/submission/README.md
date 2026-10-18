# Hồ sơ nộp bài — International Journal of Intelligent Robotics and Applications (Springer)

Đã nộp qua Editorial Manager ngày 2026-10-18.

## Bản đã nộp và bản công khai

* Bản trong repo ([`../en/manuscript.tex`](../en/manuscript.tex)) **trùng với bản đã nộp**, chỉ khác các trường thông
  tin cá nhân của tác giả (tên, cơ quan, e-mail, ORCID, câu đóng góp của tác giả, tiểu sử, ảnh), được thay bằng
  "[withheld in the public copy]".
* Bộ hồ sơ đầy đủ đã nộp (zip LaTeX, thư gửi biên tập, ảnh tác giả, nội dung form có thông tin tác giả) được giữ riêng,
  không đưa lên repo: thư mục `docs/paper/private/` nằm trong `.gitignore`. Tác giả giữ bản gốc của mình; khi sửa bài
  theo phản biện, khôi phục các trường cá nhân từ bản đó.
* Khi nộp, câu Author Contributions dùng chữ viết tắt được nhập trên form của hệ thống (form thay cho câu trong bản
  thảo khi xuất bản).

## Tệp đã tải lên Editorial Manager

| Tệp | Loại mục |
|---|---|
| zip LaTeX: `manuscript.tex`, `sn-jnl.cls`, `manuscript.pdf`, `figures/Fig1–Fig6.pdf`, ảnh tác giả | Manuscript |
| thư gửi biên tập (PDF) | Cover Letter |

Thông tin gõ vào form: [`form_answers.md`](form_answers.md) (bản công khai, đã bỏ thông tin tác giả).

## Dựng lại bản công khai

```
python3 -I docs/paper/make_figures.py en                       # Fig. 2–6
cd docs/paper/en/figures && xelatex Fig1.tex                    # Fig. 1
python3 docs/paper/build_refs.py docs/paper/en/manuscript.tex --inline
cd docs/paper/en && pdflatex manuscript && pdflatex manuscript
```
