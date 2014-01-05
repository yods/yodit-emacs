;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is the minimal config needed to get org-mode from melpa and
;; get it up and running so that we can load our emacs config from a
;; .org file in a literate manner. The basis for this can be found
;; here:
;;
;; http://orgmode.org/worg/org-contrib/babel/intro.html
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

;; This means we prefer things from ~/.emacs.d/elpa over the standard packages.
(package-initialize)

;; This bootstraps us if we don't have anything
(when (not package-archive-contents)
  (package-refresh-contents))

;; This installs elpa packages if we haven't done that yet
(defun maybe-install-and-require (p)
  (when (not (package-installed-p p))
    (package-install p))
  (require p))

;; org-mode always needs to be installed in an emacs where it isn't loaded.
(require 'org)

(org-babel-load-file (concat (getenv "HOME") "/.emacs.d/org/config.org"))


 (defun cider-repl-reset ()
       (interactive)
       (save-some-buffers)
       (with-current-buffer (cider-current-repl-buffer)
       (goto-char (point-max))
       (insert "(user/reset)")
       (cider-repl-return)))


(global-set-key (kbd "C-c r") 'cider-repl-reset)
(linum-mode 1)
