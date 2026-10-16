;;; early-init.el --- early settings -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 50 1000 1000))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq frame-inhibit-implied-resize t)

;;; early-init.el ends here
