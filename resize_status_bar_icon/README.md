# GimpScripts

## What is this?

This repository contains small utilities for GIMP (Script-Fu). The script `resize_status_bar_icon/resize_status_bar_icon.scm` resizes a source image into a full set of app status bar/badge icon sizes and exports each size as a PNG into a chosen output directory.

It appears in GIMP under `Filters` → `Custom` → `Resize Icon Sizes` after installation.

## Install on macOS

1. Locate your GIMP scripts folder. On macOS it is typically:
   - `~/Library/Application Support/GIMP/2.10/scripts`
2. Copy `resize_status_bar_icon/resize_status_bar_icon.scm` into that `scripts` folder.
3. In GIMP, go to `Filters` → `Script-Fu` → `Refresh Scripts` (or restart GIMP).

## Use in GIMP

1. Open your source image in GIMP. A square image is recommended. The script was written with a 200×200 px source in mind, but it will scale any input.
2. Run `Filters` → `Custom` → `Resize Icon Sizes`.
3. Pick the input image (if not already selected) and choose an output directory. The script will export PNGs for each target size listed below.

## Generated sizes

- **Icon Status Badge**
  - 7×7 px (1x)
  - 14×14 px (2x)
  - 11×11 px (1x)
  - 22×22 px (2x)
  - 24×24 px (1x)
  - 48×48 px (2x)
  - 50×50 px (1x)
  - 100×100 px (2x)

- **Icon Badge (Mac)**
  - 100×100 px (1x)
  - 200×200 px (2x) ← use your original if it is 200×200

Notes:

- The script currently exports the sizes under “Icon Status Badge”, including the 100×100 px PNG. For the Mac “Icon Badge (2x)”, you can use your original 200×200 image.
- Output files are named like `7x7.png`, `14x14.png`, … and saved in the directory you choose.
