# GimpScripts

## Install on macOS

1. Locate your GIMP scripts folder. On macOS it is typically:
   - `~/Library/Application Support/GIMP/2.10/scripts`
2. Copy `*.scm` into that `scripts` folder.
3. In GIMP, go to `Filters` → `Script-Fu` → `Refresh Scripts` (or restart GIMP).

## Use in GIMP

### Status bar / badge icons

1. Open your source image.
2. Run `Filters` → `Custom` → `Resize Icon Sizes`.
3. Choose an output directory. It exports:
   - 7×7, 14×14, 11×11, 22×22, 24×24, 48×48, 50×50, 100×100 PNGs.

### macOS app iconset and .icns

1. Open a large square source (recommended 1024×1024 or higher).
2. Run `Filters` → `Custom` → `Resize App Iconset`.
3. Pick an output directory. It creates an `AppIcon.iconset` folder containing:
   - `icon_16x16.png`, `icon_16x16@2x.png`
   - `icon_32x32.png`, `icon_32x32@2x.png`
   - `icon_128x128.png`, `icon_128x128@2x.png`
   - `icon_256x256.png`, `icon_256x256@2x.png`
   - `icon_512x512.png`, `icon_512x512@2x.png`

To build `AppIcon.icns` on macOS:

```sh
iconutil -c icns AppIcon.iconset -o AppIcon.icns
```
