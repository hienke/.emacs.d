;;; pkg-sync.el --- Prepair packages.
;; 
;; Copyright (C) 2012 n4k0master <nesuadark@gmail.com>
;; 
;; Created: Thu Jul 19 20:59:58 2012 (+0800)
;; Last-Updated: Sat Jul 21 14:23:46 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; Use `elpa'(offical) package manager.
(require 'package)
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-packages.el
(defvar prelude-packages
  '(
    ;; language-modes
    lua-mode
    markdown-mode
    graphviz-dot-mode                   ;`C-cc' compile, `C-cp' show pictrue.

    ;; effective tools
    undo-tree
    ace-jump-mode
    autopair
    rect-mark
    highlight-parentheses
    highlight-symbol
    header2
    quickrun
    helm                                ;fork of `anything'

    ;; ;; misc
    pos-tip
    popwin
    ;; popup-kill-ring
    ;; browse-kill-ring
    ;; sunrise-commander              ;`midnight-commander'-like files manager

    rainbow-delimiters                  ;`rainbow-parentheses'-like mode
    rainbow-mode

    solarized-theme

    ;; eye-candy
    cursor-chg
    fill-column-indicator
    ;; powerline
    ;; pretty-mode

    ;; Completions
    auto-complete
    auto-complete-clang
    yasnippet

    ;; ;; git
    ;; magit

    ;; ;; TeX
    ;; auctex

    ;; test to use
    ;; tabbar
    ))


(require 'cl)

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun prelude-install-packages ()
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p prelude-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(prelude-install-packages)


(provide 'pkg-sync)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pkg-sync.el ends here
