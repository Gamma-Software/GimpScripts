(define (resize-icon-sizes inFile outDir)
  (let* ((sizes '((7 7) (14 14) (11 11) (22 22) (24 24) (48 48) (50 50) (100 100)))
         (image (car (gimp-file-load RUN-NONINTERACTIVE inFile inFile)))
         (drawable (car (gimp-image-get-active-layer image))))
    (for-each
      (lambda (size)
        (let* ((w (car size))
               (h (cadr size))
               (copy (car (gimp-image-duplicate image)))
               (layer (car (gimp-image-get-active-layer copy)))
               (outFile (string-append outDir "/" (number->string w) "x" (number->string h) ".png")))
          (gimp-image-scale copy w h)
          (file-png-save RUN-NONINTERACTIVE copy layer outFile outFile 0 9 0 0 0 0 0)))
      sizes)
    (gimp-image-delete image)))

(script-fu-register
 "resize-icon-sizes"
 "<Image>/Filters/Custom/Resize Icon Sizes"
 "Resize a 200x200 image to all required badge sizes"
 "Your Name"
 "Your License"
 "2025"
 ""
 SF-FILENAME "Input Image" ""
 SF-DIRNAME  "Output Directory" "")