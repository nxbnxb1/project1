# Group 9d — Raspberry Pi Camera Module 3 product brief (manufacturer document)

Read by Claude in full (6 pages + back cover, 7 PDF pages) from
`scratchpad/papers/g9_dl/rpi_cm3_product_brief.pdf`, downloaded from the manufacturer's datasheet host
(datasheets.raspberrypi.com → pip-assets.raspberrypi.com, reachable directly; the documentation pages on
www.raspberrypi.com are blocked by the session proxy and were not used). "p." = PDF page.

### R1 — Raspberry Pi Camera Module 3 (Standard, NoIR, Wide, NoIR Wide), product brief
Raspberry Pi Ltd, "Raspberry Pi Camera Module 3", product brief, published June 2024 (p.1: "Published June 2024").
Status: USE (specification source for the camera presets 2 and 3 of the simulation and for Table 4 of the manuscript).

**Content (verbatim):**
- p.2: "It offers an IMX708 12-megapixel sensor with HDR, and features phase detection autofocus."
- p.2: "Camera Module 3 is available in standard and wide-angle variants, both of which are available with or without an infrared cut filter."
- p.3 (Specification): sensor Sony IMX708, 11.9 megapixels, 4608 × 2592 pixels, pixel size 1.4 µm; "Common video modes: 1080p50, 720p100, 480p120".
- p.5 (Variants table, read from the rendered table): Camera Module 3 — focal length 4.74 mm, diagonal / horizontal / vertical field of
  view 75° / 66° / 41°, F1.8; Camera Module 3 Wide — focal length 2.75 mm, 120° / 102° / 67°, F2.2.

**Citable statements:**
1. Camera Module 3 Wide có góc nhìn ngang 102° và dọc 67°; bản thường 66° × 41° (p.5, bảng Variants).
2. Hai biến thể dùng cùng cảm biến Sony IMX708 12 MP (p.2–3).

**Relation to our method:** confirms the field-of-view values of presets `cm3` (66 × 41°) and `cm3w` (102 × 67°) in
`src/config/dart_camera_preset.m`. The manuscript's Table 4 lists the vertical FOV of the image fed to the network
(16:9 crop: 40° and 70°), which is derived, not taken from this document.

**Caveats:**
- The code comment of `dart_default_config.m` mentions a 1536 × 864 @ 120 fps mode taken from retailer tables; this brief
  lists only 1080p50, 720p100 and 480p120 as common video modes. The 10 ms capture time used in the simulation is an
  assumption and should not be attributed to this document.
- Camera Module 2 (preset `v2`, 62.2 × 48.8°) is not covered by this brief; its source still has to be obtained.
