;;; early-init.el --- early settings with straight.el for Emacs 28 or later -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 50 1000 1000))

;; --------------------------------
;; straight.el (replaces package.el)
;; --------------------------------
(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install packages with straight.el by default in use-package
(setq straight-use-package-by-default t)

;; --------------------------------
;; UI
;; --------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq frame-inhibit-implied-resize t)

;;; early-init.el ends here
