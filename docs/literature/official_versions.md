# Bản chính thức của các tài liệu được trích dẫn (kiểm tra 2026-10-18)

Quy tắc: bản thảo chỉ trích **bản xuất bản chính thức** (tạp chí / kỷ yếu hội nghị / tài liệu nhà sản xuất), không trích
preprint; chỉ trích bài đã đọc toàn văn và thực sự hỗ trợ một nhận định cụ thể.

Cách kiểm tra:

* Thông tin xuất bản (nơi đăng, tập, số, trang, năm, DOI) lấy từ bản ghi Crossref của bản chính thức; với PMLR và
  NeurIPS lấy từ trang kỷ yếu.
* Lịch sử phiên bản arXiv (ngày từng phiên bản, ghi chú "accepted / to appear / published", journal ref) lấy từ arXiv để
  xác định bản đã đọc là bản nộp hay bản đã được chấp nhận.
* Bản đã đọc là bản **nộp trước khi được chấp nhận** → tải bản chính thức (bản mở: PMLR, CVF, NeurIPS, RSS, NSF PAR,
  trang tác giả có header của hội nghị) và đối chiếu lại toàn bộ trích dẫn nguyên văn của ghi chú đọc với bản đó.
  Các trích dẫn không khớp tự động chỉ khác số thứ tự tài liệu / định nghĩa bên trong bài (ví dụ "[45]" thay "[46]",
  "Def. 7" thay "Def. 8"), là siêu dữ liệu arXiv, hoặc nằm ở phụ lục không in trong bản hội nghị; mọi nhận định mà
  bản thảo dùng đều có trong bản chính thức.

Rà soát nội dung (2026-10-18): mọi câu có trích dẫn trong bản thảo được đối chiếu với trích dẫn nguyên văn của ghi chú
đọc (110 cặp câu–tài liệu: 95 đúng, 14 phát biểu rộng hơn hoặc sai phạm vi so với bài gốc, 1 gán nhầm bài); tất cả 15
chỗ đã được sửa trong bản thảo (ví dụ: phạm vi trễ một chu kỳ của Bar-Shalom, điều kiện chính xác của García-Fernández,
biên hằng ε của Yaghoubi, bối cảnh cập nhật điều khiển của Taylor, tính toán ngoài máy bay của MonoNav, kịch bản bám xe
của Suraksha, RoboRun dùng tầm nhìn chứ không dùng khoảng cách tới vật).

Cột "Bản đã đọc": `published` = đọc chính bản xuất bản; `accepted` = đọc bản đã được chấp nhận / camera-ready;
`checked` = đọc bản trước khi chấp nhận, rồi đối chiếu trích dẫn với bản chính thức.

| ID | Khoá | Trích dẫn (bản chính thức) | Bản đã đọc |
|---|---|---|---|
| A1 | `falanga2019` | Falanga, D., Kim, S., Scaramuzza, D.: How fast is too fast? The role of perception latency in high-speed sense and avoid. IEEE Robot. Autom. Lett. 4(2), 1884–1891 (2019). | accepted (authors' copy, "Accepted January, 2019") |
| A2 | `loquercio2021` | Loquercio, A., Kaufmann, E., Ranftl, R., Müller, M., Koltun, V., Scaramuzza, D.: Learning high-speed flight in the wild. Sci. Robot. 6(59), eabg5810 (2021). | accepted (arXiv v1, journal ref Science Robotics) |
| A3 | `bhattacharya2024` | Bhattacharya, A., Cannici, M., Rao, N., Tao, Y., Kumar, V., Matni, N., Scaramuzza, D.: Monocular event-based vision for obstacle avoidance with a quadrotor. In: Proc. 8th Conf. Robot Learning (CoRL), PMLR 270, 4826–4843 (2025) | checked (PMLR 270 PDF: all 7 note quotes found) |
| A6 | `liu2016` | Liu, S., Watterson, M., Tang, S., Kumar, V.: High speed navigation for quadrotors with limited onboard sensing. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 1484–1491 (2016). | published (user-supplied IEEE PDF) |
| N1 | `hsiao2022` | Hsiao, Y.-S., Hari, S.K.S., Filipiuk, M., Tsai, T., Sullivan, M.B., Reddi, V.J., Singh, V., Keckler, S.W.: Zhuyi: Perception processing rate estimation for safety in autonomous vehicles. In: Proc. 59th ACM/IEEE Design Autom. Conf. (DAC), pp. 289–294 (2022). | accepted (arXiv v1, camera-ready for DAC 2022) |
| N3 | `zhao2021` | Zhao, H., Hari, S.K.S., Tsai, T., Sullivan, M.B., Keckler, S.W., Zhao, J.: Suraksha: A framework to analyze the safety implications of perception design choices in AVs. In: Proc. IEEE 32nd Int. Symp. Softw. Reliab. Eng. (ISSRE), pp. 434–445 (2021). | published (authors' copy of the ISSRE paper) |
| N6 | `boroujerdian2021` | Boroujerdian, B., Ghosal, R., Cruz, J., Plancher, B., Reddi, V.J.: RoboRun: A robot runtime to exploit spatial heterogeneity. In: Proc. 58th ACM/IEEE Design Autom. Conf. (DAC), pp. 829–834 (2021). | accepted (arXiv v1, "will be published in DAC 2021") |
| N13 | `gog2022` | Gog, I., Kalra, S., Schafhalter, P., Gonzalez, J.E., Stoica, I.: D3: A dynamic deadline-driven approach for building autonomous vehicles. In: Proc. 17th Eur. Conf. Comput. Syst. (EuroSys), pp. 453–471 (2022). | published (user-supplied ACM PDF) |
| N14 | `pant2021` | Pant, Y.V., Abbas, H., Mohta, K., Quaye, R.A., Nghiem, T.X., Devietti, J., Mangharam, R.: Anytime computation and control for autonomous systems. IEEE Trans. Control Syst. Technol. 29(2), 768–779 (2021). | published (user-supplied IEEE PDF) |
| N10 | `aldana2023` | Aldana-Lopez, R., Aragües, R., Sagües, C.: Latency vs precision: Stability preserving perception scheduling. Automatica 155, 111123 (2023). | accepted (arXiv v1, "accepted version of an already published manuscript") |
| N11 | `huang2020` | Huang, C., Xu, S., Wang, Z., Lan, S., Li, W., Zhu, Q.: Opportunistic intermittent control with safety guarantees for autonomous systems. In: Proc. 57th ACM/IEEE Design Autom. Conf. (DAC), pp. 1–6 (2020). | accepted (arXiv v1, "Accepted by DAC 2020") |
| B1 | `ranftl2020` | Ranftl, R., Lasinger, K., Hafner, D., Schindler, K., Koltun, V.: Towards robust monocular depth estimation: Mixing datasets for zero-shot cross-dataset transfer. IEEE Trans. Pattern Anal. Mach. Intell. 44(3), 1623–1637 (2022). | accepted (arXiv v3, "To appear in TPAMI (accepted August 2020)") |
| B2 | `yang2024a` | Yang, L., Kang, B., Huang, Z., Xu, X., Feng, J., Zhao, H.: Depth Anything: Unleashing the power of large-scale unlabeled data. In: Proc. IEEE/CVF Conf. Comput. Vis. Pattern Recognit. (CVPR), pp. 10371–10381 (2024). | checked (CVF open-access CVPR PDF: claims used are present; 3 quotes differ only in reference numbers or are in the supplement) |
| B3 | `yang2024b` | Yang, L., Kang, B., Huang, Z., Zhao, Z., Xu, X., Feng, J., Zhao, H.: Depth Anything V2. In: Adv. Neural Inf. Process. Syst. (NeurIPS) 37, 21875–21911 (2024). | checked (NeurIPS proceedings PDF: all 14 note quotes found) |
| B4 | `wofk2019` | Wofk, D., Ma, F., Yang, T.-J., Karaman, S., Sze, V.: FastDepth: Fast monocular depth estimation on embedded systems. In: Proc. Int. Conf. Robot. Autom. (ICRA), pp. 6101–6108 (2019). | accepted (arXiv v1, "Accepted for presentation at ICRA 2019") |
| B5 | `simon2023` | Simon, N., Majumdar, A.: MonoNav: MAV navigation via monocular depth estimation and reconstruction. In: Ang Jr, M.H., Khatib, O. (eds.) Experimental Robotics (ISER 2023). Springer Proc. Adv. Robot., pp. 415–426. Springer, Cham (2024). | accepted (arXiv v1, version presented at ISER 2023) |
| C4 | `zhou2019` | Zhou, B., Gao, F., Wang, L., Liu, C., Shen, S.: Robust and efficient quadrotor trajectory generation for fast autonomous flight. IEEE Robot. Autom. Lett. 4(4), 3529–3536 (2019). | accepted (arXiv v2, "ACCEPTED JUNE, 2019") |
| C3 | `tordesillas2021` | Tordesillas, J., Lopez, B.T., Everett, M., How, J.P.: FASTER: Fast and safe trajectory planner for navigation in unknown environments. IEEE Trans. Robot. 38(2), 922–938 (2022). | accepted (arXiv v2, "accepted for publication in IEEE T-RO") |
| C2 | `zhou2021` | Zhou, B., Pan, J., Gao, F., Shen, S.: RAPTOR: Robust and perception-aware trajectory replanning for quadrotor fast flight. IEEE Trans. Robot. 37(6), 1992–2009 (2021). | published (user-supplied IEEE PDF, 2026-10-18) |
| C8 | `florence2018` | Florence, P.R., Carter, J., Ware, J., Tedrake, R.: NanoMap: Fast, uncertainty-aware proximity queries with lazy search over local 3D data. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 7631–7638 (2018). | accepted (arXiv v1, "To Appear at ICRA 2018") |
| C1 | `falanga2018` | Falanga, D., Foehn, P., Lu, P., Scaramuzza, D.: PAMPC: Perception-aware model predictive control for quadrotors. In: Proc. IEEE/RSJ Int. Conf. Intell. Robots Syst. (IROS), pp. 1–8 (2018). | accepted (arXiv v2, journal ref IROS 2018) |
| C6 | `zhu2019` | Zhu, H., Alonso-Mora, J.: Chance-constrained collision avoidance for MAVs in dynamic environments. IEEE Robot. Autom. Lett. 4(2), 776–783 (2019). | published (final published version, TU Delft repository) |
| C7 | `lin2020` | Lin, J., Zhu, H., Alonso-Mora, J.: Robust vision-based obstacle avoidance for micro aerial vehicles in dynamic environments. In: Proc. IEEE Int. Conf. Robot. Autom. (ICRA), pp. 2682–2688 (2020). | accepted (arXiv v2, "to be published in ICRA 2020") |
| E1 | `ames2017` | Ames, A.D., Xu, X., Grizzle, J.W., Tabuada, P.: Control barrier function based quadratic programs for safety critical systems. IEEE Trans. Autom. Control 62(8), 3861–3876 (2017). | accepted (arXiv v2, Dec 2016, DOI of the TAC paper) |
| E2 | `ames2019` | Ames, A.D., Coogan, S., Egerstedt, M., Notomista, G., Sreenath, K., Tabuada, P.: Control barrier functions: Theory and applications. In: Proc. 18th Eur. Control Conf. (ECC), pp. 3420–3431 (2019). | checked (ECC 2019 copy hosted by a co-author: claims used are present) |
| E3 | `xiao2019` | Xiao, W., Belta, C.: Control barrier functions for systems with high relative degree. In: Proc. IEEE 58th Conf. Decis. Control (CDC), pp. 474–479 (2019). | checked (CDC 2019 PDF with the IEEE header: claims used are present; quotes differ only in definition numbers) |
| E5 | `wang2017` | Wang, L., Ames, A.D., Egerstedt, M.: Safety barrier certificates for collisions-free multirobot systems. IEEE Trans. Robot. 33(3), 661–674 (2017). | published (user-supplied IEEE PDF) |
| E6 | `zeng2021` | Zeng, J., Zhang, B., Sreenath, K.: Safety-critical model predictive control with discrete-time control barrier function. In: Proc. Am. Control Conf. (ACC), pp. 3882–3889 (2021). | accepted (arXiv v3, 23 Mar 2021, final ACC 2021 version) |
| E7 | `rosolia2020` | Rosolia, U., Ames, A.D.: Multi-rate control design leveraging control barrier functions and model predictive control policies. IEEE Control Syst. Lett. 5(3), 1007–1012 (2021). | accepted (arXiv v4, 6 Jul 2020, published in L-CSS) |
| F3 | `breeden2022` | Breeden, J., Garg, K., Panagou, D.: Control barrier functions in sampled-data systems. IEEE Control Syst. Lett. 6, 367–372 (2022). | accepted (arXiv v2, "Published in IEEE Control Systems Letters") |
| F10 | `bahati2024` | Bahati, G., Ong, P., Ames, A.D.: Sample-and-hold safety with control barrier functions. In: Proc. Am. Control Conf. (ACC), pp. 5169–5176 (2024). | checked (ACC 2024 PDF with the conference header: claims used are present) |
| F1 | `molnar2022` | Molnar, T.G., Kiss, A.K., Ames, A.D., Orosz, G.: Safety-critical control with input delay in dynamic environment. IEEE Trans. Control Syst. Technol. 31(4), 1507–1520 (2023). | accepted (arXiv v2, "Accepted to the IEEE TCST") |
| F4 | `taylor2020` | Taylor, A.J., Ong, P., Cortes, J., Ames, A.D.: Safety-critical event triggered control via input-to-state safe barrier functions. IEEE Control Syst. Lett. 5(3), 749–754 (2021). | checked (published L-CSS PDF from NSF PAR: claims used are present) |
| F8 | `yang2019` | Yang, G., Belta, C., Tron, R.: Self-triggered control for safety critical systems using control barrier functions. In: Proc. Am. Control Conf. (ACC), pp. 4454–4459 (2019). | checked (ACC 2019 PDF with the conference header: claims used are present) |
| F5 | `dean2021` | Dean, S., Taylor, A.J., Cosner, R.K., Recht, B., Ames, A.D.: Guaranteeing safety of learned perception modules via measurement-robust control barrier functions. In: Proc. 2020 Conf. Robot Learning (CoRL), PMLR 155, 654–670 (2021) | checked (PMLR 155 PDF: claims used are present) |
| F7 | `yang2023` | Yang, S., Pappas, G.J., Mangharam, R., Lindemann, L.: Safe perception-based control under stochastic sensor uncertainty using conformal prediction. In: Proc. 62nd IEEE Conf. Decis. Control (CDC), pp. 6072–6078 (2023). | accepted (arXiv v2, "accepted by IEEE CDC 2023") |
| G4 | `yaghoubi2021` | Yaghoubi, S., Fainekos, G., Yamaguchi, T., Prokhorov, D., Hoxha, B.: Risk-bounded control with Kalman filtering and stochastic barrier functions. In: Proc. 60th IEEE Conf. Decis. Control (CDC), pp. 5213–5219 (2021). | accepted (arXiv v1, CDC 2021 paper) |
| E8 | `misyats2025` | Misyats, M., Harms, M., Nissov, M., Jacquet, M., Alexis, K.: Embedded safe reactive navigation for multirotors systems using control barrier functions. In: Proc. Int. Conf. Unmanned Aircr. Syst. (ICUAS), pp. 697–704 (2025). | accepted (arXiv v1, "accepted for publication at ICUAS 2025") |
| F9 | `laine2020` | Laine, F., Chiu, C.-Y., Tomlin, C.: Eyes-closed safety kernels: Safety of autonomous systems under loss of observability. In: Robotics: Science and Systems XVI (2020). | checked (RSS proceedings PDF: claims used are present) |
| R1 | `rpi_cm3` | Raspberry Pi Ltd: Raspberry Pi Camera Module 3 (Standard, NoIR, Wide, NoIR Wide), product brief (2024). | published (manufacturer document) |
| R2 | `rpi_doc` | Raspberry Pi Ltd: Camera (Raspberry Pi documentation, hardware specifications). https://www.raspberrypi.com/documentation/accessories/camera.html (2026). Accessed 18 October 2026 | published (manufacturer documentation page; full text supplied by the user, 2026-10-18) |
| H1 | `barshalom2002` | Bar-Shalom, Y.: Update with out-of-sequence measurements in tracking: Exact solution. IEEE Trans. Aerosp. Electron. Syst. 38(3), 769–777 (2002). | published (user-supplied IEEE PDF) |
| H3 | `garcia2021` | Garcia-Fernandez, A.F., Yi, W.: Continuous-discrete multiple target tracking with out-of-sequence measurements. IEEE Trans. Signal Process. 69, 4699–4709 (2021). | accepted (arXiv v2, journal ref IEEE TSP 69) |
| I1 | `lee2010` | Lee, T., Leok, M., McClamroch, N.H.: Geometric tracking control of a quadrotor UAV on SE(3). In: Proc. 49th IEEE Conf. Decis. Control (CDC), pp. 5420–5425 (2010). | published (user-supplied IEEE PDF, 2026-10-18) |
| M1 | `mehrotra1992` | Mehrotra, S.: On the implementation of a primal–dual interior point method. SIAM J. Optim. 2(4), 575–601 (1992). | published (user-supplied SIAM PDF) |

## Không trích dẫn nữa (và lý do)

| ID | Tài liệu | Lý do |
|---|---|---|
| A4 | Zhao et al., *Towards Safety-Aware Computing System Design in Autonomous Vehicles* (arXiv:1905.08453) | chỉ có bản preprint; không có bản xuất bản |
| A5 | Vyas et al., *TAPAS* (arXiv:2607.17317) | được chấp nhận ở ESWEEK-CODES 2026 nhưng chưa có bản xuất bản (không có bản ghi Crossref) |
| G8 | Han et al., *Risk-Aware Belief CBFs over Random Finite Sets* (arXiv:2607.15016) | chỉ có bản preprint |
| F2 | Singletary et al., CDC 2020 (arXiv:2005.06418v1) | đã đọc bản nộp; bản CDC không có bản mở; nội dung được thay bằng F10 (Bahati et al., ACC 2024, đã đối chiếu bản chính thức) |
| G7 | Jian et al., ICRA 2023 (arXiv:2209.08539v1) | đã đọc bản nộp; bản ICRA không có bản mở; nhận định trùng với C6 (Zhu & Alonso-Mora, đã đọc bản xuất bản) |
| E5b | Wang et al., ACC 2016 (arXiv:1609.00651) | bản arXiv là bản mở rộng 8 trang, khác bài ACC 6 trang; nhận định trùng với E5 (T-RO 2017, đã đọc bản xuất bản) |
| D1, D3 | Krener (AHMPC); Bøhn et al. (RL horizon) | không cần cho lập luận của bài (chỉ là bối cảnh của luật chọn tầm dự báo) |
| C5 | Zhou et al., *EGO-Planner* | không cần cho lập luận của bài |
| N15 | Shahsavari et al., T-RO 2025 | robot mặt đất, mục tiêu năng lượng; không hỗ trợ nhận định cụ thể nào của bài |
| B6 | Xue et al., *DepthART* (arXiv:2607.17099) | được chấp nhận ở ACM MM 2026 nhưng chưa có bản xuất bản |
| G9, D7 | Kishida (CDC 2024); Gräfe et al. (IFAC-PapersOnLine 2022) | liên quan hẹp; không cần cho lập luận hiện tại |
| C9 | Roelofsen et al., ICRA 2017 | bản đã đọc (kho EPFL) không in nơi đăng, không xác nhận được là bản chính thức; nhận định về trường nhìn hạn chế đã được E8 (Misyats et al., ICUAS 2025) hỗ trợ |
