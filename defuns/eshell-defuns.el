;; https://github.com/jimm/elisp/blob/master/eshell-customize.el#L56
;;;###autoload
(defun short-pwd (p-lst)
  (if (> (length p-lst) 3)
      (concat
       (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                  (substring elm 0 1)))
                  (butlast p-lst 3)
                  "/")
       "/"
       (mapconcat (lambda (elm) elm)
                  (last p-lst 3)
                  "/"))
    (mapconcat (lambda (elm) elm)
               p-lst
               "/")))


;; `C-a' to beginning of line, and `C-a C-a' to beginning of command line.
;; http://www.emacswiki.org/emacs/EshellFunctions#toc6
;;;###autoload
(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line))))


;; ...
;;;###autoload
(defun user-ret ()
  (interactive)
  (let ((input (eshell-get-old-input)))
    (if (string-equal input "")
        (progn
          (insert "ls")
          (eshell-send-input))
      (progn
        (cond
         ((string-match "^\\.+$" input)
          (let ((len (length input))(n 2)(p ".."))
            (while (> len n )
              (setq n (1+ n))(setq p (concat p "/..")))
            (eshell-bol)(kill-line)
            (insert p)
            (eshell-send-input)))
         (t
          (eshell-send-input))))
      )))


;; Use `emacs <filename1,[filename2,...]>' command in eshell.
;; http://www.emacswiki.org/emacs/EshellFunctions#toc2
;;;###autoload
(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))


;; Delete backup files(*~).
;; http://www.emacswiki.org/emacs/EshellFunctions#toc9
;;;###autoload
(defun eshell/ro ()
  "Delete files matching pattern \".*~\" and \"*~\""
  (eshell/rm (directory-files "." nil "^\\.?.*~$" nil)))


;; Clear command for eshll.
;; http://www.khngai.com/emacs/eshell.php
;;;###autoload
(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


;; Open image files in eshell.
;; https://github.com/ran9er/init.emacs/blob/master/_extensions/%2Beshell.el
;;;###autoload
(defun eshell/img(img)
  (propertize "Image" (quote display) (create-image (expand-file-name img))))


;;;###autoload
(defun eshell/exit ()
  (bury-buffer))

