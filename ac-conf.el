;;; ac-conf.el --- Auto-complete and yasnippet configs.
;; 
;; Copyright (C) 2012 n4k0master <nesuadark@gmail.com>
;; 
;; Created: Thu Jul 19 21:01:50 2012 (+0800)
;; Last-Updated: Fri Jul 20 21:53:55 2012 (+0800)
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; M-x package-install RET auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dot-emacs-dir "/ac-dict/"))
(ac-config-default)
(global-auto-complete-mode t)


(define-key ac-complete-mode-map "\t"      'ac-complete)
(define-key ac-complete-mode-map "\r"       nil)

(define-key ac-complete-mode-map "\C-n"    'ac-next)
(define-key ac-complete-mode-map "\C-p"    'ac-previous)
(define-key ac-complete-mode-map "\M-/"    'ac-stop)



;; After selecting candidates, `TAB' will behave as `RET'
(setq ac-dwim t)

(ac-set-trigger-key "TAB")
;; (setq ac-auto-start nil)
(setq ac-auto-show-menu 0.1)
;; (setq ac-delay 0.5)


;; (setq ac-auto-start nil)

(setq-default ac-sources
              '(ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers
                ac-source-words-in-all-buffer
                ac-source-filename
                ))



;; Use `yasnippet' backend.
;; M-x package-install RET yasnippet
(require 'yasnippet)
(yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")

;; (yas/global-mode 1)

(add-hook 'prog-mode-hook
          '(lambda ()
             (yas/minor-mode)))

(setq yas/trigger-key "TAB")

;; M-x package-install RET helm
;; (require 'helm)
;; http://emacswiki.org/Yasnippet#toc6
(defun shk-yas/helm-prompt (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
  (interactive)
  (setq display-fn (or display-fn 'identity))
  (if (require 'helm-config)
      (let (tmpsource cands result rmap)
        (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
        (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
        (setq tmpsource
              (list
               (cons 'name prompt)
               (cons 'candidates cands)
               '(action . (("Expand" . (lambda (selection) selection))))
               ))
        (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
        (if (null result)
            (signal 'quit "user quit!")
          (cdr (assoc result rmap))))
    nil))

;; (setq yas/prompt-functions '(yas/dropdown-prompt))
(setq yas/prompt-functions '(shk-yas/helm-prompt))




;; Use `clang' backend.
;; M-x package-install RET auto-complete-clang
(require 'auto-complete-clang)

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
              (split-string
               "
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4/x86_64-pc-linux-gnu
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include/g++-v4/backward
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/4.5.3/include-fixed
 /usr/include
")))


(add-hook
 'c-mode-common-hook
 '(lambda()
    (setq ac-sources (append
                      '(ac-source-yasnippet
                        ac-source-clang)
                      ac-sources))))


(provide 'ac-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ac-conf.el ends here
