;; popwin (C-g to hide temp buffer)
(use-package popwin
  :init
  (progn
    (setq display-buffer-function 'popwin:display-buffer)

    ;; Conflict between `popwin' and `Icicles', because of `completion-list-mode'.
    (setq popwin:special-display-config
          '(help-mode
            (compilation-mode :noselect t)
            "*Apropos*"
            "*Shell Command Output*" "*Async Shell Command*"
            "*Compile-Log*" "*TeX Help*"
            (" *undo-tree*" :position bottom)))
    ))

;; if use M-x way enable `rainbow-mode', M-o M-o to refontify.
(use-package rainbow-mode
  :commands rainbow-mode
  :init
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))))

(use-package guide-key
  :diminish guide-key-mode
  :init
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x c" "C-x RET" "C-c p" "C-c C-x"))
    (guide-key-mode 1)
    (setq guide-key/recursive-key-sequence-flag t)
    (setq guide-key/popup-window-position 'bottom)))

(use-package keyfreq
  :init
  (progn
    (setq keyfreq-file "~/.emacs.d/keyfreq")
    (keyfreq-mode 1)
    (keyfreq-autosave-mode 1)))

;; (use-package hi-lock
;;   :bind (("M-o l" . highlight-lines-matching-regexp)
;;          ("M-o r" . highlight-regexp)
;;          ("M-o w" . highlight-phrase)))

;; chinese input method
(use-package eim
  :commands eim-use-package
  :init
  (progn
    (setq eim-use-tooltip nil)
    (register-input-method
     "eim-py" "Chinese-GB" 'eim-use-package
     "拼音" "汉字拼音输入法" "py.txt")
    ))
