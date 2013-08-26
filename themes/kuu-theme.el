(deftheme kuu
  "empty here")

(let* ((class '(class color) (min-colors 89))
       (black   "#212526") (grey-d    "#41423f")
       (red     "#f92672") (red-l     "#f92672")
       (green   "#a6e22e") (green-l   "#a6e22e")
       (yellow  "#f4bf75") (yellow-l  "#f4bf75")
       (blue    "#66d9ef") (blue-l    "#66d9ef")
       (magenta "#ae81ff") (magenta-l "#ae81ff")
       (cyan    "#a1efe4") (cyan-l    "#a1efe4")
       (grey-l  "#f5f4f1") (white     "#f5f4f1")
       )
  
  (custom-theme-set-faces
   'kuu
   '(default ((t (:foreground ,black :background ,grey-l))))
   '(cursor ((t (:background ,red))))
   '(fixed-pitch ((t (:family "Monospace"))))
   '(variable-pitch ((t (:family "Sans Serif"))))
   '(escape-glyph ((t (:foreground "#c4a000"))))
   '(minibuffer-prompt ((t (:foreground "#b4fa70"))))
   '(highlight ((t (:foreground "#2e3436" :background "#edd400"))))
   '(region ((t (:background "#555753"))))
   '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
   '(secondary-selection ((t (:background "#204a87"))))
   '(trailing-whitespace ((t (:background "#a40000"))))

   ;; font-lock
   '(font-lock-builtin-face ((t (:foreground "#ad7fa8"))))
   '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
   '(font-lock-comment-face ((t (:foreground "#73d216"))))
   '(font-lock-constant-face ((t (:foreground "#e6a8df"))))
   '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
   '(font-lock-function-name-face ((t (:foreground "#fce94f"))))
   '(font-lock-keyword-face ((t (:foreground "#b4fa70"))))
   '(font-lock-negation-char-face ((t nil)))
   '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
   '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   '(font-lock-string-face ((t (:foreground "#e9b96e"))))
   '(font-lock-type-face ((t (:foreground "#8cc4ff"))))
   '(font-lock-variable-name-face ((t (:foreground "#fcaf3e"))))
   '(font-lock-warning-face ((t (:inherit (error)))))
   
   '(button ((t (:inherit (link)))))
   '(link ((t (:underline (:color foreground-color :style line) :foreground "#729fcf"))))
   '(link-visited ((t (:underline (:color foreground-color :style line) :foreground "#3465a4" :inherit (link)))))
   '(fringe ((t (:background "#212526"))))
   '(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90")) (((class color grayscale) (background dark)) (:box nil :foreground "grey90" :background "grey20")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))
   '(tooltip ((((class color)) (:inherit (variable-pitch) :foreground "black" :background "lightyellow")) (t (:inherit (variable-pitch)))))
   '(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#2e3436" :background "#d3d7cf"))))
   '(mode-line-buffer-id ((t (:weight bold))))
   '(mode-line-emphasis ((t (:weight bold))))
   '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
   '(mode-line-inactive ((t (:weight light :box (:line-width -1 :color nil :style released-button) :foreground "#eeeeec" :background "#555753" :inherit (mode-line)))))
   '(isearch ((t (:foreground "#eeeeec" :background "#ce5c00"))))
   '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
   '(lazy-highlight ((t (:background "#8f5902"))))
   '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
   '(next-error ((t (:inherit (region)))))
   '(query-replace ((t (:inherit (isearch))))))

  (custom-theme-set-variables
   'kuu
   `(ansi-color-names-vector
     [,black ,red ,green ,yellow ,blue ,magenta ,cyan ,white])
   `(ansi-term-color-vector
     [unspecified ,black ,red ,green ,yellow ,blue ,magenta ,cyan ,white])))

(provide-theme 'kuu)

;; Local Variables:
;; no-byte-compile: t
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End: