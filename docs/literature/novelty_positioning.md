# Định vị tính mới của DART (dựa trên các bài đã đọc toàn văn)

Tài liệu này chỉ dựa trên các bài **đã đọc toàn văn**; mã bài (A1, N1, …) trỏ tới [`reading_list.md`](reading_list.md) và ghi chú chi tiết có số trang + trích nguyên văn trong [`notes/`](notes/). Hai bài được đọc hai lần dưới hai mã: N5 ≡ A1 (Falanga et al. RA-L 2019), N2 ≡ A5 (TAPAS), N8 ≡ F8 (self-triggered CBF).

## 1. Kết luận ngắn

* **DART không thể nhận là công trình đầu tiên suy ra tần số perception từ điều kiện an toàn.** Zhuyi [N1] (Hsiao et al., DAC 2022) đã làm việc này: với mỗi vật thể, tìm độ trễ lớn nhất mà xe vẫn phanh gấp kịp, rồi đặt tần số xử lý khung hình tối thiểu bằng nghịch đảo của độ trễ đó, tính liên tục khi chạy (tr. 1–3). Với drone, RoboRun [N6] dùng hạn chót (tầm nhìn − quãng phanh)/vận tốc (tr. 4, Eq. 1). Falanga et al. [A1/N5] cho cận độ trễ dạng đóng ở pha thiết kế.
* **Kích hoạt theo "thời gian an toàn còn lại" đã có cho cập nhật điều khiển**, chưa có cho perception: safe period của self-triggered CBF [F8/N8]; CIPS [N9] có định lý an toàn và kích hoạt khi thời gian còn lại ≤ L + 2Δt; bỏ qua tính toán điều khiển có bảo đảm [N11] (vẫn cảm nhận mỗi bước).
* **Đóng góp bảo vệ được của DART là sự tích hợp**: một mô hình bất định duy nhất (sự tăng hiệp phương sai của ước lượng giữa hai lần perception) và một ràng buộc frontier cho vật cản chưa thấy cùng nuôi (i) bộ kích hoạt suy luận depth học được có độ trễ và (ii) các ràng buộc MPC/CBF của bộ điều khiển; đánh giá trong vòng kín trên UAV với monocular depth.
* **Cách diễn đạt đề xuất:** "lập lịch perception theo an toàn kiểu Zhuyi, được mở rộng cho bất định ước lượng, vùng chưa quan sát và kích hoạt suy luận trong vòng kín, đồng thiết kế với MPC/CBF có phồng theo bất định trên UAV có tài nguyên tính toán hạn chế".

## 2. Theo từng thành phần

| Thành phần DART | Đã có trong các bài đã đọc | Điều chưa thấy (khoảng trống) | Đánh giá trung thực |
|---|---|---|---|
| 1. Cập nhật tại thời điểm chụp (bộ đệm pose, một frame đang xử lý) | KF trễ cập nhật tại thời điểm chụp cho mạng monocular trên Jetson [H2]; cập nhật OOS chính xác bằng retrodiction [H3] (chính xác trừ khi hai tập trễ rơi vào cùng khoảng); mô hình "một job đang xử lý" và predictor có xét trễ [N10]; dự đoán qua trễ tốt hơn coi trễ là nhiễu [F6]. | Áp dụng cho vật cản trích từ depth học được có sai số scale/shift theo frame trên UAV. | **Kỹ thuật chuẩn, không phải đóng góp mới.** Trình bày như lựa chọn kỹ thuật cần thiết; ablation F_NODELAY cho thấy mức độ quan trọng. |
| 2. Scheduler theo an toàn (khoảng mở an toàn, frontier, kích hoạt sự kiện) | Tần số tối thiểu an toàn theo động học phanh [N1]; hạn chót tầm nhìn–quãng phanh cho drone [N6]; cận độ trễ dạng đóng [A1]; safe period / thời gian còn lại [F8, N9]; khoảng lấy mẫu suy ra từ cận sai số perception nhưng **hằng** [F7]; thích nghi FPS vì năng lượng theo độ phức tạp cảnh, không theo an toàn [A5/N2, N12, N7]. | (a) Tăng hiệp phương sai trong khoảng mở — Zhuyi [N1, tr. 6] và CIPS [N9, tr. 6] để là hướng tương lai; A1 giả thiết không có bất định (tr. 2). (b) Frontier cho vật thể chưa phát hiện trong bộ kích hoạt lúc chạy — Zhuyi để "yet-to-be-detected objects" là hướng tương lai (tr. 6). (c) Kích hoạt chính suy luận perception trong vòng kín, đo cả số suy luận tiết kiệm và kết cục va chạm — Zhuyi chỉ kiểm chứng ở tần số cố định (tr. 4). (d) UAV + monocular depth học được. | Nguyên lý đã được thiết lập; **điểm mới là (a)+(b)+(c)+(d)**. Cần baseline kiểu Zhuyi để chứng minh (a)+(b) có ích → biến thể `Z_ZHUYI`. |
| 3. MPC horizon thích nghi + reset hiệp phương sai dự kiến | Horizon theo thời gian tới xung đột, horizon tối thiểu bao quãng phanh, có chứng minh [D4, preprint]; AHMPC theo Lyapunov [D1, D2]; horizon tốt nhất phụ thuộc độ bất định thông tin vật cản [D3]; lan truyền hiệp phương sai dọc lịch perception ứng viên trong quy hoạch động (không vật cản) [N10]; MPC + DCBF với ellipse Kalman phồng dọc horizon [G7]; chance-constrained MPC với nửa không gian phồng theo hiệp phương sai [C6, C7]. | Horizon gắn với thời điểm có phép đo kế tiếp và hiệp phương sai reset tại các thời điểm đo dự kiến. | **Đóng góp yếu**: nhiều thành phần đã có; kết quả ablation hiện chưa cho thấy lợi ích an toàn của horizon thích nghi → nên trình bày là thành phần phụ hoặc bỏ khỏi danh sách đóng góp. |
| 4. Braking-CBF với phồng d(t) theo hiệp phương sai | Dạng braking barrier [E5b, eq. 8]; CBF lấy mẫu cần biên tăng theo khoảng cập nhật [F3]; phồng sai số xấu nhất qua trễ [F1]; biên từ sai số perception học [F5]; biên theo hiệp phương sai lúc chạy [G5, G6, G3 dạng đóng cho nửa không gian]; tập vật cản lớn dần giữa các mẫu [G1]; an toàn qua một lần cập nhật nhưng "khôi phục trước lần cập nhật kế tiếp" bỏ ngỏ [G8, Remark 4]; biên đo hằng η = 0.5 m [N9]. | Phồng tăng theo hiệp phương sai giữa các lần perception và **dùng cùng mô hình với bộ kích hoạt perception** (scheduler đảm bảo điều kiện dừng còn đúng hết khoảng mở; CBF giữ nó ở mỗi chu kỳ). | CBF tự nó không mới; **điểm mới là sự ghép nối với scheduler** — trả lời đúng câu hỏi G8 để ngỏ. |

## 3. Điểm DART yếu hơn (phải nói rõ trong bài)

* **Chỉ mô phỏng.** A1, A2, A3, B5, C2, C3, G5–G8 và một số bài nhóm N (N2, N6 HIL, N7) có thử nghiệm phần cứng hoặc HIL.
* **Không có chứng minh hình thức cho scheduler** như F8 (safe period), N9 (định lý 5.1–5.2), C3 (khả thi đệ quy). An toàn của DART là bằng chứng Monte-Carlo. Nên phát biểu một mệnh đề có điều kiện (ví dụ: nếu ước lượng nằm trong vùng β-sigma và trễ ≤ τ̂ thì điều kiện dừng còn đúng trong khoảng mở) và nói rõ giả thiết.
* **Không có chứng chỉ xác suất an toàn** như G2, G3, G4, G8.
* **Chỉ vật cản cầu**; G1, G6 xử lý hình lồi tổng quát.
* **Lập luận tiết kiệm năng lượng cần thận trọng**: RoboRun [N6] cho thấy năng lượng tính toán dưới 0.05% năng lượng drone (tr. 5). Nên lập luận theo khả dụng của bộ tăng tốc (chia sẻ với các tác vụ khác), nhiệt, và khả năng dùng mô hình depth lớn hơn ở cùng mức an toàn.
* **Giả thiết độ trễ lớn cần dẫn chứng**: FastDepth chỉ 5.6 ms trên TX2 GPU [B4]; dẫn chứng cho trễ hàng chục–hàng trăm ms: Depth Anything V2 60–213 ms trên V100 [B3], ZoeDepth trong MonoNav 0.11–0.16 s [B5], depth học onboard 73 ms [A3], mạng pose monocular 0.18–0.40 s trên Orin NX [H2].
* **Phanh là cận bảo thủ**: phụ lục của A1 cho thấy né ngang nhanh hơn phanh ở tốc độ cao.

## 4. Hệ quả cho thí nghiệm (đã/đang thực hiện)

1. **Baseline kiểu Zhuyi** (`Z_ZHUYI`): giống DART nhưng scheduler tính khoảng mở an toàn chỉ từ động học phanh trên ước lượng điểm (không tăng hiệp phương sai, không trigger theo độ bất định) và không có frontier. So với `E_DART` → cô lập giá trị của (a)+(b).
2. **Baseline tần số cố định / bỏ khung cố định** (`FR_SAFE_f`, `G_FR_LOW`) — tương ứng hướng N2/N12.
3. **Baseline luôn perception** (`A_FR_FN`, `FR_SAFE_10`) — tương ứng C7.
4. **Sai số depth scale + shift** (B1, B2, B3): quét `shift`.
5. Báo cáo kết cục va chạm trong vòng kín, không chỉ số suy luận (khác A5/N2, N7 vốn open-loop).

## 5. Bài nên đọc thêm (chưa đọc — không được dùng cho tới khi đọc)

Cần bạn tải tay: Gog et al., *D3: A Dynamic Deadline-Driven Approach for Building Autonomous Vehicles*, EuroSys 2022, doi:10.1145/3492321.3519576; Pant et al., *Anytime computation and control for autonomous systems*, IEEE TCST 29(2), 2021; Shahsavari et al., *A coordinated approach to control mechanical and computing resources in mobile robots*, IEEE T-RO 41, 2025; Liu et al., *High speed navigation for quadrotors with limited onboard sensing*, ICRA 2016.
