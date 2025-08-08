(define (resize-app-icon inFile outDir)
  (let* ((base-sizes '((16 16) (32 32) (128 128) (256 256) (512 512)))
         (image (car (gimp-file-load RUN-NONINTERACTIVE inFile inFile)))
         (drawable (car (gimp-image-get-active-layer image)))
         (iconset-dir (string-append outDir "/AppIcon.iconset")))
    ; Ensure output iconset directory exists
    (catch #t
      (lambda () (file-mkdir iconset-dir))
      (lambda (key . params) #f))

    (for-each
      (lambda (size)
        (let* ((w (car size))
               (h (cadr size))
               (oneX (string-append iconset-dir "/icon_" (number->string w) "x" (number->string h) ".png"))
               (twoX (string-append iconset-dir "/icon_" (number->string w) "x" (number->string h) "@2x.png"))
               (copy1 (car (gimp-image-duplicate image)))
               (layer1 (car (gimp-image-get-active-layer copy1)))
               (copy2 (car (gimp-image-duplicate image)))
               (layer2 (car (gimp-image-get-active-layer copy2))))
          ; 1x
          (gimp-image-scale copy1 w h)
          (file-png-save RUN-NONINTERACTIVE copy1 layer1 oneX oneX 0 9 0 0 0 0 0)
          (gimp-image-delete copy1)
          ; 2x
          (gimp-image-scale copy2 (* w 2) (* h 2))
          (file-png-save RUN-NONINTERACTIVE copy2 layer2 twoX twoX 0 9 0 0 0 0 0)
          (gimp-image-delete copy2)))
      base-sizes)

    (gimp-image-delete image)))

(script-fu-register
  "resize-app-icon"
  "<Image>/Filters/Custom/Resize App Iconset"
  "Export macOS AppIcon.iconset PNGs (16, 32, 128, 256, 512 @1x and @2x). Use macOS iconutil to build AppIcon.icns afterwards."
  "valentin rudloff"
  "MIT"
  "2025"
  ""
  SF-FILENAME "Input Image" ""
  SF-DIRNAME  "Output Directory" "")


