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
- The 10 ms capture time used in the simulation is an assumption and should not be attributed to this document.
- Camera Module 2 (preset `v2`) is not covered by this brief; its source is R2 below. The 1536 × 864 @ 120 fps mode of the
  presets `cm3` / `cm3w`, which the code comments attribute to retailer tables, is listed in R2 (not in this brief).

### R2 — Raspberry Pi documentation, "Camera" (accessories), section "Hardware specifications"
Raspberry Pi Ltd, https://www.raspberrypi.com/documentation/accessories/camera.html, accessed 2026-10-18.
Source: the full text of the page was pasted into the conversation by the user on 2026-10-18 (the www.raspberrypi.com
pages are blocked by the session proxy and were not fetched by Claude). Read in full. Licence stated on the page:
"Raspberry Pi documentation is copyright © 2012-2026 Raspberry Pi Ltd and is licensed under a Creative Commons
Attribution-ShareAlike 4.0 International (CC BY-SA) licence."
Status: USE (specification source for the preset `v2`; confirms the values of `cm3` and `cm3w`).

**Content (verbatim; table cells read row by row):**
- Section "Camera Module 2": "This 8-megapixel camera is built around the Sony IMX219 sensor with a resolution of
  3280 × 2464 pixels."
- Section "Camera Module 3": "This 12-megapixel camera is built around the Sony IMX708 sensor with a resolution of
  4608 × 2592 pixels."
- Table "Hardware specifications", columns Camera Module 2 / Camera Module 3 / Camera Module 3 Wide:
  - Video modes: "1080p47, 1640 × 1232p41 and 640 × 480p206" / "2304 × 1296p56, 2304 × 1296p30 HDR, 1536 × 864p120" /
    same as Camera Module 3.
  - Focal length: 3.04 mm / 4.74 mm / 2.75 mm.
  - Horizontal Field of View (FoV): 62.2 degrees / 66 degrees / 102 degrees.
  - Vertical Field of View (FoV): 48.8 degrees / 41 degrees / 67 degrees.
  - Focal ratio (F-Stop): F2.0 / F1.8 / F2.2.

**Citable statements.**
1. Camera Module 2 (IMX219): horizontal × vertical field of view 62.2° × 48.8°; video mode 1640 × 1232 at 41 fps.
2. Camera Module 3 and 3 Wide (IMX708): video mode 1536 × 864 at 120 fps; fields of view as in R1.

**Relation to our method.** Confirms every field-of-view and video-mode value of `src/config/dart_camera_preset.m`
(v2: 62.2 × 48.8°, 1640 × 1232 @ 41 fps → 280 × 210 network input; cm3 / cm3w: 1536 × 864 @ 120 fps). The code
comment "retailer specification tables (the official Raspberry Pi pages were not reachable)" describes where the values
were first taken from; the code is left unchanged (final algorithm version).
